# UpTune, Copyright Shaojie Xiang (sx233@cornell.edu), 2018-2019
# See the LICENSE file for copyright information.

### TODO
  * support rpc session for multi-platform communication
  * support comment-out syntax in complement for TuneBool 
  * support automatic deployment to local/aws/gcp
  * support autotuning with inter-variable constraint  

### 2019-12-25
  * added permutation support & rename
  * updated api for easy integration
  * support extern tuner as plugin-in into autotvm (builder + runner required. also for samplers and optimizer + cost model)

### 2019-12-11
  * support deamon auto-tuning server with ray-like API
  * replace returned value as symbolic variable

### 2019-11-09 
  * added placeholder replacement feature for tuning non-python file 

### 2019-11-05 
  * added baysien net structure recovery for causal learning 
  * added c++ template for building lower level intrinscs 
  * added support for importing history data

### 2019-10-10 
  * fixed the sqlalchemy cfg generation issue
  * added the runtime limit increase reminder
  * added the cfg display support with `--cfg` arg

### 2019-09-11 
  * added constraint features 
  * added support for tuning across gpus
  * updated target decorator (support ut.tune inside)

### 2019-09-01 
  * updated api for automatic tuning type inference 
  * updated module import mechanism for constraint feature

### 2019-07-21
  * unified interface for controller initilization 
  * added adaptive work dierctory selection on shared FS 
  * added Amazon AWS support for cluster auto-tuning 

### 2019-05-30
  * replaced message passing interface with file access
  * added `__tmp__` to store template files 

### 2019-05-28
  * fixed ZMQ msg encoding issue (in intrusive mode)
  * updated XGBoost objective to squared error 
  * incorporated single stage tuning into current flow  
  * enabled automatic clean-up func before running 

### 2019-05-27
  * resolved control conflicts of intrusive / template tuning  
  * supported single/double quotes in regex value detection 
  * migration to Python 3.7 

### 2019-05-21
  * added support of decouple tuning 
  * support real-time tuning result plotting 

### 2019-03-21
  * added ResNet-18 Example for HeteroCL

### 2019-03-11
  * introduced intrusive APIs for specifying tuning variable  
  * added OS environment specifier for different tuning mode   
  * added ZeroMQ framework for proposal distribution over cluster 

### 2019-03-02
  * added README and basic use cases
  * fixed Jinja tojson render error for Boolean vars with filter patch

### 2019-02-26
  * added the objective declaration support in annotation  
  * added report-api mapping mode and auto-test shell script for LAMBDA
  * disabled `RUNNING` status in opentuner's desired result
  * updated `cache` method of ML instance for re-training 

### 2019-02-21
  * updated command line interface to suppotr mixed command and meta-parameter 
  * updated learning models abstraction for re-training and parameterization  
  * added multi-stage auto-tuning support based on fine-grained control logics
  * added example of LAMBDA on Quartus LUT flow (for hybrid/online/vinilla mode) 
  * added `tojson` filter to Jinja template render for string type

### 2019-02-18
  * added HeteroCL schedule tuning example for BNN acceleration 
  * added CLI clean mode (clean imtermediate files with "uptune clean")  
  * update the regex pattern for accurate matching
  * add support to limit process runtime (process killed if timeout)

### 2019-02-17 
  * enabled Command Line Interface ("python -m uptune.on cmd" or "uptune cmd")
  * added Jinja Template Engine for code generation on ray run() function
  * added Template Parsing and Generation for auto-tuning and proposal assignment
  * added fine-grained auto-tuning control APIs in api.py
  * test and Error cases + Environment set-up scripts 
  * added tuning data type template (TuneFloat + TuneResult)
  * enabled Metaclass Mode for class registration

### 2019-02-09
  * added tuning data type template (TuneInt + TuneEnum)
  * added learning model support as modular plugins for search space pruning  

### 2018-12-17
  * added support for calling function spawned in ThreadPool with time limit (defined by user)
  * added EZTuner GCC benchamark(`gccflags/eztune.py`) over OpenTuner baseline(`gccflags.py`) 
  * added Support for recording timing out results in global DB (for ML training) 

