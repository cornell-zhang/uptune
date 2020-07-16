import sys
import sqlite3
from sqlite3 import Error
import matplotlib.pyplot as plt

open_str = "../ezdb/opentuner-"
eztune_str = "../ezdb/"
designs = ["matrixmultiply", "tsp_ga", "raytracer"]
tuners = ["opentuner", "eztune"]
average = 10
parallelism = 4
generation = 100
gtype = "runtime"
techniques = ["DifferentialEvolutionAlt", 
              "NormalGreedyMutation", 
              "RandomNelderMead", 
              "UniformGreedyMutation"]

# return avergae of diff trails  
# call the draw() function to save the result 
def avg(design, tuner):
    cases = list()
    for index in range(average):
      if tuner == "opentuner":
        db_str = open_str + design + "-" + str(index+1) +".db"
        session = connect(db_str)
        trial = case(extract(session, tuner), gtype)
        cases.append(trial)
        session.close()
      elif tuner == "eztune":
        db_str = eztune_str + design + "-global" + str(index+1) +".db"
        session = connect(db_str)
        trial = case(extract(session, tuner), gtype)
        cases.append(trial)
        session.close()
      else:
        sys.exit("unrecognized tuner")
      
    # cal avg with raw data
    assert len(cases) == average, "less trails than expected"
    if gtype == "runtime":
      sumup = [sum(x) for x in zip(*cases)]
      avg_val = [float(i)/float(average) for i in sumup] 
      return avg_val
    elif gtype == "winning-rate":
      t1 = [x[0] for x in cases] 
      t2 = [x[1] for x in cases] 
      t3 = [x[2] for x in cases] 
      t4 = [x[3] for x in cases] 
      s1 = [sum(x) for x in zip(*t1)]
      s2 = [sum(x) for x in zip(*t2)]
      s3 = [sum(x) for x in zip(*t3)]
      s4 = [sum(x) for x in zip(*t4)]
      a1 = [float(i)/float(average) for i in s1] 
      a2 = [float(i)/float(average) for i in s2] 
      a3 = [float(i)/float(average) for i in s3] 
      a4 = [float(i)/float(average) for i in s4] 
      return a1, a2, a3, a4
    else:
      sys.exit("wrong type")

def min_so_far(trial):   
    new = list()
    for index in range(len(trial)):
      new.append(min(trial[:index+1]))
    assert len(new) == len(trial), "wrong length"
    return new

# connect and return a conn
def connect(db_str):
    try:
      conn = sqlite3.connect(db_str)
      return conn
    except Error as e:
      print(e)
    return None 

# get time sequecne in diff case. 
# data = [dict{T1:t1..}, ..] for one trail
def case(data, graph):
    runtime = list() 
    w1, w2, w3, w4 = [1], [1], [1], [1]
    d1, d2, d3, d4 = [], [], [], []
    mean = 0
    for item in data: 
      if graph == "runtime":
         values = list()
         for x in item.values():
           values += x
         runtime.append(min(values))
      
      # ----------------------------------------
      # cal winning rate: # over mean / # of points
      # -----------------------------------------
      if graph == "winning-rate":
        for key, val in item.items():
          if key == "DifferentialEvolutionAlt":
            d1 += val
          elif key == "NormalGreedyMutation":
            d2 += val
          elif key == "RandomNelderMead":
            d3 += val
          elif key == "UniformGreedyMutation":
            d4 += val
        mean, num = info(d1, d2, d3, d4)
        w1.append(rate(d1, mean, num))
        w2.append(rate(d2, mean, num))
        w3.append(rate(d3, mean, num))
        w4.append(rate(d4, mean, num))

    if graph == "runtime":
      return min_so_far(runtime)
    if graph == "winning-rate":
      return [w1, w2, w3, w4]


# cal mean and # of data of given lists
def info(*argv):
    collect = list()
    for arg in argv:
      collect += arg
    collect = [x for x in collect if x != float('inf')]
    return float(sum(collect)) / max(len(collect), 1), len(collect)    

# cal winning rate of this
def rate(dlist, mean, num):
    over_mean = 0
    for val in dlist:
      if val > mean: over_mean += 1 
    return float(over_mean)/num

# get lists of dict{t1:time} for 1 trail
def extract(session, tuner):   
    data = list()
    for epoch in range(generation):
      result = process(query(session, tuner, epoch), tuner)
      data.append(result)
    return data
      
# get dictionary from orm objects
# objects = [(tech, time)...]
def process(objects, tuner):
    item = dict()
    for obj in objects:
      if obj[0] in item: item[obj[0]].append(float(obj[1]))
      else: item[obj[0]]  = [float(obj[1])]
      assert obj[0] in techniques, "unspecified tech"
    assert len(item) > 0, "not enough data"
    return item 

# query the global best or winning rate with pf
def query(session, tuner, epoch):
    cur = session.cursor()
    if tuner == "opentuner":
      cur.execute("SELECT desired_result.requestor, result.time \
                   FROM desired_result INNER JOIN result \
                   ON desired_result.result_id=result.id \
                   WHERE desired_result.generation=?", (epoch,))
    elif tuner == "eztune":
      cur.execute("SELECT technique, result \
                   FROM global_result WHERE epoch=?", (epoch,))
    rows = cur.fetchall()
    assert len(rows) > 0, "no results available for " + str(epoch)
    return rows
    
# -----------------------------------
# arm winning rate + global best perf 
# -----------------------------------
for design in designs:
  figure = plt.figure()
  if gtype == "runtime":
    ax = plt.subplot(111)
    for tuner in tuners: # opentuner & eztun
      sequence = avg(design, tuner)
      ax.plot(range(len(sequence)), sequence, label=str(tuner))
    plt.ylabel('Runtime')
    plt.xlabel('Generation')
    plt.title(str(design))
    ax.legend()
    plt.show()
 
  else:
    for tuner in tuners: # opentuner & eztun
      plt.subplot(1,2,tuners.index(tuner)+1)
      r1, r2, r3, r4 = avg(design, tuner)
      plt.plot(range(len(r1)), r1, label=techniques[0])
      plt.plot(range(len(r2)), r2, label=techniques[1])
      plt.plot(range(len(r3)), r3, label=techniques[2])
      plt.plot(range(len(r4)), r4, label=techniques[3])
      plt.ylabel('Winning rate')
      plt.xlabel('Generation')
      plt.title(str(design) + " of " + str(tuner))
      plt.legend()
    plt.show()

    
   
