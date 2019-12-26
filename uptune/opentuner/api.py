from datetime import datetime
from uptune.opentuner import tuningrunmain
from uptune.opentuner.resultsdb.models import DesiredResult, Result


class TuningRunManager(tuningrunmain.TuningRunMain):
  """
  This class manages a tuning run in a "slave" configuration, where main()
  is controlled by an another program.
  """
  def __init__(self, measurement_interface, args, **kwargs):
    super(TuningRunManager, self).__init__(measurement_interface, args, **kwargs)
    self.init()
    self.tuning_run.state = 'RUNNING'
    self.commit(force=True)
    self.search_driver.external_main_begin()

  def get_next_desired_result(self):
    """
    Returns a uptune.opentuner.resultsdb.DesiredResult that should be tested next.
    """
    dr = self.measurement_driver.query_pending_desired_results().first()
    if dr is None:
      self.search_driver.external_main_generation()
      dr = self.measurement_driver.query_pending_desired_results().first()
      if dr is None:
        return None
    # self.measurement_driver.claim_desired_result(dr)
    dr.limit = self.measurement_driver.run_time_limit(dr)
    return dr

  def get_desired_results(self):
    """
    Returns a list of all uptune.opentuner.resultsdb.DesiredResult that should be tested next.
    """
    drs = self.measurement_driver.query_pending_desired_results().all()
    if len(drs) == 0:
      self.search_driver.external_main_generation()
      drs = self.measurement_driver.query_pending_desired_results().all()
      if len(drs) == 0:
        return []
    for dr in drs:
      self.measurement_driver.claim_desired_result(dr)
      dr.limit = self.measurement_driver.run_time_limit(dr)

    return drs

  def report_result(self, desired_result, result, result_input=None):
    """
    Report a measured result.  desired_result should have been returned by
    get_next_desired_result().
    """
    self.measurement_driver.report_result(desired_result, result, result_input)

  def get_best_configuration(self):
    """
    The best configuration found so far.  From the current tuning run only.
    """
    try:
      return self.search_driver.best_result.configuration.data
    except AttributeError:
      return None

  def get_best_result(self):
    """
    The best result found so far.  From the current tuning run only.
    """
    try:
      return self.search_driver.best_result
    except AttributeError:
      return None

  def finish(self):
    """
    Called at the end of the tuning process to call hooks and close database
    connections.
    """
    self.search_driver.external_main_end()
    # self.measurement_interface.save_final_config(
    #     self.search_driver.best_result.configuration)
    # self.tuning_run.final_config = self.search_driver.best_result.configuration
    self.tuning_run.state = 'COMPLETE'
    self.tuning_run.end_date = datetime.now()
    self.commit(force=True)
    self.session.close()

  def sync(self, global_results):
    """
    synchronize the data between different nodes (epoch-wise) 
    claim desired results and report with build-in APIs
    """
    for gr in global_results:

      config = self.search_driver.get_configuration(gr.data) 
      dr = DesiredResult(configuration=config,
                         requestor=gr.technique,
                         generation=self.search_driver.generation,
                         request_date=datetime.now(),
                         tuning_run=self.tuning_run)
      self.session.flush()
      self.session.add(dr)
      self.session.commit()
      
      result = Result(time=gr.result) 
      self.report_result(dr, result)


