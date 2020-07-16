import collections
from gcc_flags import cfg_to_flags, flags_mean_time 

def flags_histogram(session):
  counter = collections.Counter()
  q = session.query(TuningRun).filter_by(state='COMPLETE')
  total = q.count()
  for tr in q:
    print(tr.program.name)
    for flag in cfg_to_flags(tr.final_config.data):
      counter[flag] += old_div(1.0, total)
  print(counter.most_common(20))

def flag_importance(best_cfg):
  """
  Test the importance of each flag by measuring the performance with that
  flag removed.  Print out a table for paper
  """
  flags = cfg_to_flags(best_cfg)
  counter = collections.Counter()
  baseline_time = flags_mean_time(flags)

  for flag in flags[1:]:
      delta_flags = [f for f in flags if f != flag]
      flag_time = flags_mean_time(delta_flags)
      impact = max(0.0, flag_time - baseline_time)
      if math.isinf(impact):
          impact = 0.0
      counter[flag] = impact
      print(flag, '{:.4f}'.format(impact))

  total_impact = sum(counter.values())
  remaining_impact = total_impact
  print(r'\bf Flag & \bf Importance \\\hline')
  for flag, impact in counter.most_common(20):
      print(r'{} & {:.1f}\% \\\hline'.format(flag, 100.0 * impact / total_impact))
      remaining_impact -= impact
  print(r'{} other flags & {:.1f}% \\\hline'.format(
      len(flags) - 20, 100.0 * remaining_impact / total_impact))
# 

