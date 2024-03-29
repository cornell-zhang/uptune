#!/usr/bin/env python
from __future__ import print_function
import adddeps  # fix sys.path

import uptune
from uptune import ConfigurationManipulator
from uptune import IntegerParameter
from uptune import MeasurementInterface
from uptune import Result


class GccFlagsTuner(MeasurementInterface):

  def manipulator(self):
    """
    Define the search space by creating a
    ConfigurationManipulator
    """
    manipulator = ConfigurationManipulator()
    manipulator.add_parameter(
      IntegerParameter('BLOCK_SIZE', 1, 10))
    return manipulator

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data

    gcc_cmd = 'g++ mmm_block.cpp '  
    gcc_cmd += ' -D{0}={1}'.format('BLOCK_SIZE',cfg['BLOCK_SIZE'])
    gcc_cmd += ' -o ./tmp.bin'

    compile_result = self.call_program(gcc_cmd)
    assert compile_result['returncode'] == 0

    run_cmd = './tmp.bin'

    run_result = self.call_program(run_cmd)
    assert run_result['returncode'] == 0

    return Result(time=run_result['time'])

  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print("Optimal block size written to mmm_final_config.json:", configuration.data)
    self.manipulator().save_to_file(configuration.data,
                                    'mmm_final_config.json')


if __name__ == '__main__':
  print(uptune)
  argparser = uptune.default_argparser()
  GccFlagsTuner.main(argparser.parse_args())
