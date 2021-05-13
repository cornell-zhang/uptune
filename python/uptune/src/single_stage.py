import re
import time
import sys, ray, json, logging, os
from uptune.api import ParallelTuning, RunProgram

log = logging.getLogger(__name__)

class Controller(ParallelTuning):
    def __init__(self, cls, args, *pargs, **kwargs): 
        super(Controller, self).__init__(cls, args, *pargs, **kwargs)
        self.prepare_workdir(copy=True)

def single_run_builder(cmd, timeout):
    entry = cmd.split()[0]
    if re.search(r'.*?\.py', entry):
        cmd = 'python ' + cmd
    
    # TODO: generate multifiles from tmpl
    filename = cmd.split()[1]

    def run(self, dr, global_id):
        self.start_run()
        self.set_global_id(global_id)

        # dump dr into tmpl for executable script
        if os.path.isfile('template.tpl'):
            self.dumper.codegen(self.index, dr, filename)

        # run the executable script with time limit
        start_time = time.time()
        result = self.call_program(cmd, limit=timeout)
        eval_time = time.time() - start_time

        if result['returncode'] != 0: 
            if result['stderr']: 
                log.warning("Process collapsed with error on " + \
                             "node %d, error msg: %s", \
                             self.index, result['stderr'].decode('utf-8'))
                if not result['stderr'].decode('utf-8'):
                    log.warning("Current runtime limit is %d. " + \
                                "consider increase with -rt option", timeout)
            pair = [ self.index, {}, eval_time, float('inf') ]

        # Parse the local output log and return the QoR
        # back to central controller 
        # Format [ index, {co-variates}, eval_time, QoR ]
        try: 
            log_file = "ut.qor_stage0.json"
            assert os.path.isfile(log_file), "[ FATAL ] QoR log {} not found on node #{}. " \
                " cmd - {}. \n {}".format(log_file, self.index, cmd, self.stderr)
        
            # Read the last (latest measurement QoR)
            with open(log_file, 'r') as fp:
                index, res, trend = json.load(fp)[-1]
                assert isinstance(res, (int, float)), \
                    "[ FATAL ] QoR target should return a real value. Got {}".format(type(res))

            if trend == 'max':
               res = (-1.0) * res

            # Collect registered values (co-variates that can be used in causal analysis)
            covars_log = "ut.features_covars.json"
            covars = dict()
            if os.path.isfile(covars_log):
                f = open(covars_log, 'r')
                covars = json.load(f)
                f.close()
            pair = [ index, covars, eval_time, res ]

        except Exception as e:
            msg = f"Parse data failure on node {self.index}"
            msg += ". Check output log for details"
            log.warning(msg)
            pair = [ self.index, {}, eval_time, float('inf') ]

        open("finish.out", 'a').close()
        self.end_run() 

        pair.insert(0, self.global_id)
        return pair

    return run

