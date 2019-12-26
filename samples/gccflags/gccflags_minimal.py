#!/usr/bin/env python
# Autotune flags to g++ to optimize the performance of apps/raytracer.cpp
# This is an extremely simplified version meant only for tutorials
#
import adddeps  # fix sys.path

import uptune, ray
from uptune.api import ParallelTuning 
from uptune import ConfigurationManipulator
from uptune import EnumParameter
from uptune import IntegerParameter
from uptune import MeasurementInterface
from uptune import Result

GCC_FLAGS = [
  'align-functions', 'align-jumps', 'align-labels',
  'align-loops', 'asynchronous-unwind-tables',
  'branch-count-reg', 'branch-probabilities',
  # ... (176 total)
]

# (name, min, max)
GCC_PARAMS = [
  ('early-inlining-insns', 0, 1000),
  ('gcse-cost-distance-ratio', 0, 100),
  ('iv-max-considered-uses', 0, 1000),
  # ... (145 total)
]


class GccFlagsTuner(MeasurementInterface):

  def manipulator(self):
    """
    Define the search space by creating a
    ConfigurationManipulator
    """
    manipulator = ConfigurationManipulator()
    manipulator.add_parameter(
      IntegerParameter('opt_level', 0, 3))
    for flag in GCC_FLAGS:
      manipulator.add_parameter(
        EnumParameter(flag,
                      ['on', 'off', 'default']))
    for param, min, max in GCC_PARAMS:
      manipulator.add_parameter(
        IntegerParameter(param, min, max))
    return manipulator

  def compile(self, cfg, id):
    """
    Compile a given configuration in parallel
    """
    gcc_cmd = 'g++ apps/raytracer.cpp -o ./tmp{0}.bin'.format(id)
    gcc_cmd += ' -O{0}'.format(cfg['opt_level'])
    for flag in GCC_FLAGS:
      if cfg[flag] == 'on':
        gcc_cmd += ' -f{0}'.format(flag)
      elif cfg[flag] == 'off':
        gcc_cmd += ' -fno-{0}'.format(flag)
    for param, min, max in GCC_PARAMS:
      gcc_cmd += ' --param {0}={1}'.format(
        param, cfg[param])
    return self.call_program(gcc_cmd)
  
  def run_precompiled(self, desired_result, input, limit, compile_result, id):
    """
    Run a compile_result from compile() sequentially and return performance
    """
    assert compile_result['returncode'] == 0

    try:    
        run_result = self.call_program('./tmp{0}.bin'.format(id))
        assert run_result['returncode'] == 0
    finally:
        self.call_program('rm ./tmp{0}.bin'.format(id))

    return Result(time=run_result['time'])

  def compile_and_run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data
    compile_result = self.compile(cfg, 0)
    return self.run_precompiled(desired_result, input, limit, compile_result, 0)


# ---------------------------
# for EZTune expr
# ---------------------------
class ProgramTune(ParallelTuning):
    """ 
    Uptune auto-generate test class
    unbound method run() to run in parallel and return feedback
    """
    def __init__(self, args, *pargs, **kwargs):
      super(ProgramTune, self).__init__(args, *pargs, **kwargs)
      ray.init()
      self.before_run()

    @ray.remote
    def run(idx, cfg):
      import subprocess, os
      from timeit import timeit
      os.chdir(str(idx))
      GCC_FLAGS = [
        'align-functions', 'align-jumps', 'align-labels',
        'align-loops', 'asynchronous-unwind-tables',
        'branch-count-reg', 'branch-probabilities',
        # ... (176 total)
      ]
      
      # (name, min, max)
      GCC_PARAMS = [
        ('early-inlining-insns', 0, 1000),
        ('gcse-cost-distance-ratio', 0, 100),
        ('iv-max-considered-uses', 0, 1000),
        # ... (145 total)
      ]
      gcc_cmd = 'g++ apps/raytracer.cpp -o ./tmp.bin'
      # gcc_cmd += ' -O{0}'.format(cfg['opt_level'])
      for flag in GCC_FLAGS:
        if cfg[flag] == 'on':
          gcc_cmd += ' -f{0}'.format(flag)
        elif cfg[flag] == 'off':
          gcc_cmd += ' -fno-{0}'.format(flag)
      for param, min, max in GCC_PARAMS:
        gcc_cmd += ' --param {0}={1}'.format(
          param, cfg[param])
      p = subprocess.Popen(gcc_cmd, shell=True)
      p.communicate()

      os.chdir('../')
      return timeit("subprocess.call('./tmp.bin')", setup = "import subprocess", number = 1)

if __name__ == '__main__':
    argparser = uptune.default_argparser()
    pt = ProgramTune(argparser.parse_args())
    pt.main(ProgramTune.run)
