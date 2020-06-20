import os, sys, re, subprocess
from collections import OrderedDict

def get_timing(design, workdir, stage):
  """get timing from different stage"""
  slack , tns =  'None', 'None'
  f = open(workdir + '/' + design + '.sta.' + stage + '.summary', 'r')
  while True:
    line = f.readline()
    if 'Slack' in line:
      slack = format(float(line.split(':')[-1].rstrip().lstrip().replace(',','')), '.2f')
      continue
    elif 'TNS' in line:
      tns = format(float(line.split(':')[-1].rstrip().lstrip().replace(',','')), '.2f')
      break
  f.close()
  return slack, tns

def get_settings(cwd, enum):
    settings = []
    f = open(cwd + '/options.tcl', 'r')
    lines = f.readlines()
    f.close()
    for i in range(0, 10):
      line = lines[i].lstrip().rstrip().replace('"', '').split()
      flag = line[2].lstrip().rstrip()
      value = ' '.join(line[3:]).lstrip().rstrip()
      try:
        if re.match("^\d+?\.\d+?$", value) is None:
          settings.append(int(value))
        else:
          settings.append(float(value))
      except ValueError:
        settings.append(enum[value])
    return settings

def get_syn_features(design, workdir):
    """ extract features from syn rpt"""
    syn_features = OrderedDict()
    syn_features['boundary_port'] = 'None'
    syn_features['fourteennm_ff'] = 'None'
    syn_features['fourteennm_lcell_comb'] = 'None'
    syn_features['fourteennm_mac'] = 'None'
    syn_features['Max LUT depth'] = 'None'
    syn_features['Average LUT depth'] = 'None'
    f = open(workdir + '/' + design + '.syn.rpt', 'r')
    lines = f.readlines()
    f.close()
    for line in lines:
      for feature in syn_features:
        if feature in line:
          tmp = line.split(';')[2].rstrip().lstrip().replace(',','')
          if re.match("^\d+?\.\d+?$", tmp) is None:
            syn_features[feature] = int(tmp)
          else:
            syn_features[feature] = format(float(tmp), '.2f')
          break
    return syn_features

def get_utilization(design, workdir, stage):
    """get resources utilization"""
    features = OrderedDict()
    features['Logic utilization (in ALMs)'] = 'None'
    features['Total dedicated logic registers'] = 'None'
    features['Total pins'] = 'None'
    features['Total block memory bits'] = 'None'
    features['Total RAM Blocks'] = 'None'
    features['Total DSP Blocks'] = 'None'
    f = open(workdir + '/' + design + '.fit.' + stage + '.summary', 'r')
    lines = f.readlines()
    f.close()
    for line in lines:
      for feature in features:
        if feature in line:
          features[feature] = line.split(':')[1].rstrip().lstrip().replace(',','')
          if '/' in features[feature]:
            features[feature] = int(features[feature].split('/')[0].rstrip().lstrip())
          else:
            features[feature] = int(features[feature])
          break
    return features


# valid for early_place and place only
def get_more_utilization(design, workdir, stage): 
    place_features = OrderedDict()
    place_features['Logic LABs'] = 'None'
    place_features['Memory LABs'] = 'None'
    place_features['8 input functions'] = 'None'
    place_features['7 input functions'] = 'None'
    place_features['6 input functions'] = 'None'
    place_features['5 input functions'] = 'None'
    place_features['4 input functions'] = 'None'
    place_features['Combinational ALUT usage for route-throughs'] = 'None'
    place_features['ALMs adjustment for power estimation'] = 'None'
    place_features['Total MLAB memory bits'] = 'None'
    place_features['Maximum fan-out'] = 'None'
    place_features['Highest non-global fan-out'] = 'None'
    place_features['Total fan-out'] = 'None'
    place_features['Average fan-out'] = 'None'
    f = open(workdir + '/' + design + '.fit.' + stage + '.rpt', 'r')
    lines = f.readlines()
    f.close()
    for i in range(0, len(lines)):
      if '; Fitter Resource Usage Summary' in lines[i]:
        start_idx = i
        continue
      elif '; Fitter Resource Utilization by Entity' in lines[i]:
        end_idx = i
        break
    lines = lines[start_idx:end_idx]
    for line in lines:
      for feature in place_features:
        if feature in line:
          place_features[feature] = line.split(';')[2].rstrip().lstrip().replace(',','')
          if place_features[feature] == 'N/A':
            place_features.pop(feature)
          elif '/' in place_features[feature]:
            tmp = place_features[feature].split('/')[0].rstrip().lstrip()
            if re.match("^\d+?\.\d+?$", tmp) is None:
              place_features[feature] = int(tmp)
            else:
              place_features[feature] = format(float(tmp), '.2f')
          else:
            if re.match("^\d+?\.\d+?$", place_features[feature]) is None:
              place_features[feature] = int(place_features[feature])
            else:
              place_features[feature] = format(float(place_features[feature]), '.2f')
          break
    return place_features


enum = {
        'on'            : 1  ,
        'On'            : 1  ,
        'off'           : -1 ,
        'Off'           : -1 ,
        'Auto'          : 0  ,
        'Speed'         : 1  ,
        'Area'          : -1 ,
        'Balanced'      : 0  ,
        'Fast'          : 1  ,
        'Always'        : 1  ,
        'Never'         : -1 ,
        'Automatically' : 0  ,
        'Standard Fit'  : 1  ,
        'Auto Fit'      : -1 ,
        'High'          : 1  ,
        'Medium'        : 0  ,
        'Low'           : -1 ,
        'Normal'        : 1  ,
        'Pack All IO Registers' : 0 ,
        'Extra effort'  : 1  ,
        'Normal compilation' : 0 ,
        'All Paths'     : 1  ,
        'IO Paths and Minimum TPD Paths' : 0 ,
        'MAXIMUM'       : 0  ,
        'MINIMUM'       : -1 ,
        'Gray'          : 1  ,
        'Johnson'       : -1 ,
        'Minimal Bits'  : 2  ,
        'One-Hot'       : -2 ,
        'Sequential'    : 3  ,
        'User-Encoded'  : -3 ,
        'DSP blocks'    : 1  ,
        'Logic Elements': 2  ,
        'Simple 18-bit Multipliers' : -2 ,
        'Simple Multipliers' : 3 ,
        'Width 18-bit Multipliers' : -3 ,
        'Automatic'     : 0  ,
        'Force All Tiles with Failing Timing Paths to High Speed' : 1 ,
        'Force All Used Tiles to High Speed' : -1 ,
        'Minimize Power Only' : 2 ,
        'Minimize Area' : 2  ,
        'Minimize Area with Chains' : -2 ,
        'Sparse'        : 3  ,
        'Sparse Auto'   : -3
        }


def getQuartus(design, workdir):

    features = OrderedDict()
    syn_util  = get_syn_features(design, workdir)
    plan_util = get_utilization(design, workdir, 'plan')
    slack_plan, tns_plan = get_timing(design, workdir, 'plan')

    early_place_util = get_utilization(design, workdir, 'early_place')
    early_place_more_util = get_more_utilization(design, workdir, 'early_place')
    slack_early_place, tns_early_place = get_timing(design, workdir, 'early_place')

    place_util = get_utilization(design, workdir, 'place')
    place_more_util = get_more_utilization(design, workdir, 'place')
    slack_place, tns_place = get_timing(design, workdir, 'place')

    features.update(syn_util)
    features.update(plan_util)
    features.update(early_place_util)
    features.update(early_place_more_util)
    features.update(place_util)
    features.update(place_more_util)

    features.update({"slack_plan": slack_plan,
                     "tns_paln"  : tns_plan,
                     "slack_early_place" : slack_early_place,
                     "tns_early_place" : tns_early_place,
                     "slack_place" : slack_place,
                     "tns_place" : tns_place})
    return features

