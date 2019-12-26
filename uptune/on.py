#! /usr/bin/env python
import sys
import os
import cmd
import uptune
import logging
from datetime import datetime
from importlib import import_module 
from uptune.src.codegen import codegen

log = logging.getLogger(__name__)

class Namespace:
    """
    namspace for arguments    
    """
    def __init__(self, **kwargs):
        self.__dict__.update(kwargs)


class Uptune(cmd.Cmd):
    """
    command line interface for configuration 
    generate code and launch tuning 
    """

    def __init__(self, completekey='tab', stdin=None, stdout=None, skip=None):
        cmd.Cmd.__init__(self, completekey, stdin, stdout)
        if stdout:
            self.use_rawinput = 0
        self.prompt = '(uptune) '
        self.aliases = {}
        self.mainpyfile = ''
        self._wait_for_mainpyfile = 0

        try:
            import readline
        except ImportError:
            pass

    def do_quit(self, args):
        """Quits the program."""
        print("Quitting.")
        raise SystemExit


def interactive():
    """ 
    interactive command line mode 
    """
    if not sys.argv[1:] or sys.argv[1] in ("--help", "-h"):
        print("usage: python -m uptune.on scriptfile [arg] ...")
        sys.exit(2)

    mainpyfile =  sys.argv[1]    
    if not os.path.exists(mainpyfile):
        print('Error:', mainpyfile, 'does not exist')
        sys.exit(1)

    # remove uptune.on from argument list
    del sys.argv[0] 
    sys.path[0] = os.path.dirname(mainpyfile) 

    # import default namespace passing to codegen 
    argparser = uptune.default_argparser()
    codeargs = argparser.parse_args()

    shell = Uptune()
    shell.cmdloop("[INFO] uptune start running " + ' '.join(sys.argv))


def get_val(string, val):
    """
    return env or default for auto-tuning meta-params
    """
    try: return os.environ[string]
    except: return val
    

def main():
    """ 
    generating cfg with passed in arguments  
    """
    if not sys.argv[1:] or sys.argv[1] in ("--help", "-h"):
        print("usage: \"python -m uptune.on script [args] \" or \"uptune sctipt [args] \"")
        sys.exit(2)

    # clean mode to rm tmp files (keep params & covars)
    os.system('rm -rf __uptune__ default.json feats.json \
               template.tpl res-*.json')
    if len(sys.argv) == 2 and sys.argv[1] == "clean":
        sys.exit('[     0s]    INFO uptune.on: temporary files cleaned up')

    mainpyfile =  sys.argv[2] if sys.argv[1] == 'python' else sys.argv[1]
    if not os.path.exists(mainpyfile):
        print('Error:', mainpyfile, 'does not exist')
        sys.exit(1)

    # remove uptune.on from argument list
    del sys.argv[0] 
    sys.path[0] = os.path.dirname(mainpyfile) 

    # remove the known args from argv and extract cmd
    argparser = uptune.default_argparser()
    args, unknown = argparser.parse_known_args()

    # import cfg for meta-params if existent
    if os.path.isfile('cfg.py'):
        import_module('cfg')
        codeargs = Namespace(**cfg.args)
    else:
        codeargs = Namespace(timeout  = get_val('TIMEOUT', args.timeout),
                             parallel = get_val('PARALLEL', args.parallel_factor),
                             budget   = get_val('BUDGET', args.test_limit))

    # set up timeout, budget and test limit
    args.test_limit = codeargs.budget
    args.parallel_factor = codeargs.parallel
    args.timeout = codeargs.timeout

    sys.argv = sys.argv[:1] + unknown
    command = ' '.join(sys.argv)
 
    # mode: template  - single & multi  
    #       intrusive - single & multi $ decouple
    ctrl, mode, tpl = codegen(mainpyfile, args, command)
    print('[     0s]    INFO uptune.on: running with %s mode; %s' % 
               (str(mode), 'using template: ' + str(tpl)))
    if mode == "single":  
        ctrl.main(template=tpl)
    elif mode == "multi": 
        ctrl.multirun(template=tpl)
    elif mode == "decouple": 
        ctrl.decouple()
    
if __name__ == '__main__':
    main()
    
    
