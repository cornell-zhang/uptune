import re, os, sys, ray, json, logging
from uptune.api import ParallelTuning, RunProgram

log = logging.getLogger(__name__)

# ---------------------------------------------------
# Controller and func builders for general tuning
# ---------------------------------------------------

class Controller(ParallelTuning):
    """
    top-level controller with copying file enabled 
    """
    def __init__(self, cls, args, *pargs, **kwargs): 
        super(Controller, self).__init__(cls, args, *pargs, **kwargs)
        self.before_run(copy=True)
 

def single_run_builder(cmd, timeout):
    """
    build ray run() with subprocess
    """
    entry = cmd.split()[0]
    if re.search(r'.*?\.py', entry):
        cmd = 'python ' + cmd
    
    # TODO: generate multifiles from tmpl
    filename = cmd.split()[1]

    def run(self, dr):
        self.start_run()
        # dump dr into tmpl for executable script
        if os.path.isfile('template.tpl'):
            self.dumper.codegen(self.index, dr, filename)

        # run the executable script with time limit
        result = self.call_program(cmd, limit=timeout)
        if result['returncode'] != 0: 
            log.warning("process collapsed with error on " + \
                         "node %d, error msg: %s", \
                         self.index, result['stderr'].decode('utf-8'))
            if not result['stderr'].decode('utf-8'):
                log.warning("current runtime limit is %d. " + \
                            "consider increase with -rt option", timeout)
            self.end_run()
            return [-1, float('inf')]

        try: # parse result and return
            assert os.path.isfile('res-0.json'), \
                   'res-0.json not found in current path'
            with open('res-0.json', 'r') as fp:
                index, res, trend = json.load(fp)[-1]
                assert isinstance(res, (int, float)), \
                    'feedback function should return a real value'
            fp.close()
            if trend == 'max':
               res = (-1.0) * res

            # collect features (covariates)
            if os.path.isfile('covars.json'):
                f = open('covars.json', 'r')
                covars = json.load(f)
                f.close()
            else: covars = dict()
            pair = [index, covars, res]

        except Exception as e:
            log.warning("parse data failure on ndoe %d, \
                         return inf. %s", self.index, e.message)
            self.end_run()
            return float('inf')

        self.end_run()
        return pair

    return run

