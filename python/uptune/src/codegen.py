import pandas as pd
import re, os, sys, json, copy, random, ray, uptune, logging, subprocess
from uptune.api import ParallelTuning, RunProgram
from uptune.src.intrusive import mpisystem

log = logging.getLogger(__name__)

TPL_INT   = ["IntegerParameter", "name", (0, 1000)]
TPL_ENUM  = ["EnumParameter", "name", []]
TPL_FLOAT = ["FloatParameter", "name", (0, 1000)]
TPL_LOG   = ["LogIntegerParameter", "name", (0, 1000)]
TPL_BOOL  = ["BooleanParameter", "name", '']
TPL_PERM  = ["PermutationParameter", "name", []]

TPL_DICT  = {
    "TuneInt"   : TPL_INT,
    "TuneEnum"  : TPL_ENUM,
    "TuneFloat" : TPL_FLOAT,
    "TuneLog"   : TPL_LOG,
    "TuneBool"  : TPL_BOOL
}

INIT  = r'(\S+)\s*=\s*(Tune[a-zA-Z]+)\((.*?),\s*'  # capture Tune Specifier
SCOPE = '(?:(\(.*?\))|(\[.*\]))'                   # capture [] or ()
TAIL  = ',*\s*(.*?)\)'                             # capture name tracker
OBJ   = r'(\S+)\s*=\s*TuneRes\((?:(max)|(min))\)'  # capture the obejctive

# unique name and result list 
unique, objective = set(), set()
if os.path.isfile("archive.csv"):
    names = pd.read_csv("archive.csv").columns[2:-1] 
else: names = set()
name_counter = -1

def random_name(unique, name):
    """
    generate a random name for tuning variable 
    """
    if len(names) > 0: # used pre-generated names
       global name_counter
       name_counter += 1
       return names[name_counter]
    if name: # check dup
        assert name not in unique, "duplicate name: " + name
        unique.add(name)
        return name
    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    while True:
        value = "".join(random.choice(chars) for _ in range(8))
        if value not in unique:
            unique.add(value)
            break
    return value


def get_params(group, content):
    """
    check content validity in {% %} and return params list
    token : eval(string) used to generate params.json
    orgin: local variable name to be tuned
    """
    token_list, origin_list = list(), list()
    pattern = INIT + SCOPE + TAIL
    param_list = re.finditer(pattern, content)
    errmsg = "Invalid parameter declaration: %s in %s" % (group, content) 

    # for tuning variables 
    for item in param_list:
        origin, ptype, default, scope, array, name = item.groups()
        assert default != '', errmsg + "\n invalid default value"

        token = copy.deepcopy(TPL_DICT.get(ptype, errmsg))
        assert isinstance(token, str) == False, token

        token[1] = eval(name) if name else str(random_name(unique))
        token[2] = eval(array) if not scope else eval(scope)
        token_list.append(token)
        origin_list.append(origin)

    return token_list, origin_list


def validity_check(params, origins, content, index):
    """
    check the validity of params (e.g. [IntegerParam, name, scope])
    replace the right-val of orgins for Jinja if valid
    return flag, line number and corresponding substitution  
    """
    errmsg = "invalid annotation %s" % content[index]
    assert len(params) > 0, errmsg 
    candidates = content[index:index+2]
    legacy = copy.deepcopy(candidates)

    for idx in range(len(params)):
        category, name, scope = params[idx]
        origin = origins[idx]

        # check the parameter validity 
        if category == 'FloatParameter':
            assert type(scope) == tuple, "tuple scope for TuneFloat"
            assert len(scope) == 2, "tuple (lower, upper) for TuneFloat"
            assert scope[0] < scope[1], "invalid scope range"

        if category == 'EnumParameter':
            assert type(scope) == list, "list scope for TuneEnum"
            assert len(scope) > 1, "at least one option in scope for TuneEnum"

        if category == 'IntegerParameter':
            assert type(scope) == tuple, "tuple scope for TuneInt"
            assert len(scope) == 2, "tuple (lower, upper) for TuneInt"
            assert scope[0] < scope[1], "invalid scope range"
            assert all(isinstance(x, int) for x in scope), "only integer accepted"

        # search the clean inceptive scope for matching
        match_res, cursor = list(), -1
        for c in candidates:

            # move the comments from the candidate pool and match
            cleanstr = re.sub(r'{%.*?%}', '', c) 
            matchstr = '(' + origin + '\s*=\s*((?:\'|\")*[a-zA-Z0-9 _]+(?:\'|\")*))\s*,*\)*'
            match = re.search(matchstr, cleanstr) 
            try: 
                match_res.append(match.groups())
                cursor = candidates.index(c) 
            except:  
                pass
        assert len(match_res) == 1, \
               'multiple or no matches found for \'%s\' in %s' \
               % (origin, legacy[0] + legacy[1])
        assert cursor > -1, \
               'parameter %s not found within the incpetive scope' % origin

        # replace the match with jinja template 
        sentence, val = match_res[0] 
        template = '${{ cfg[\'' + name +'\'] | tojson | patch }}' 
        candidates[cursor] = candidates[cursor].replace(sentence, 
                                                        sentence.replace(val, template)) 
    return candidates 


def create_template(content):
    """
    parse and create json + template for parameter manipulator
    """
    params_pool = list()
    pattern = r'{%(.*)%}'  
    template = copy.deepcopy(content)

    for index in range(len(content)):
        line = content[index]
        m = re.search(pattern, line.rstrip('\n'))
        if m:
            params, origins = get_params(m.group(1), line)
            lines  = validity_check(params, 
                                    origins,
                                    content, 
                                    index)

            # replace the lines with alter
            template[index:index+2] = lines
            params_pool += params
        elif any(word in content for word in ['{%', '%}']):
            log.warning("missing {% or %} in %s", content)
            sys.exit(1)

    if len(params_pool) > 0:
        with open('params.json', 'w') as fp, \
             open('template.tpl', 'w') as fout:
            json.dump([params_pool], fp)
            fout.writelines(template)
        fp.close()
        fout.close()
        return template

    return False
    

def codegen(filename, args, command, output=False):
    """ 
    python: parse the code and genearte @ray run(). for other language
    codegen(readline(code))) generates params.json for controller 
    and code_new.ext compilable 
    """
    with open(filename) as f:
        content = f.readlines()
    f.close()

    template = create_template(content)
    if output:
        print(template)
        sys.exit()

    if template: 
        assert os.path.isfile('template.tpl'), \
               "no template generated"
    return mpisystem(args, command)


if __name__ == '__main__':
    os.environ['EZTUNING'] = 'ON'
    
    
