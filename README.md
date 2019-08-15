# UpTune Project 

A Generic Distributed Auto-Tuning Infrastructure

## Getting Started

### Installation

Pull back the repo and install the package with `install` mode

```
git clone https://github.com/cornell-zhang/uptune.git
cd uptune; pip install -e . 
```

### Quick Start 
 
Here's a quick example to tune the hyperparameters in a Multilayer Perceptron (MLP) for improved classification accuracy. Import `uptune` package and declare the tunable variables using `var = ut.tune(default, range)`, then specify the return value with `ut.feedback(value, objective)`

```python
import uptune as ut
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation

model = Sequential([
    # search units on integer number space
    Dense(ut.autotune(100, (50, 150)), input_shape=input_shape, activation='relu'),
    # search dropout rate on real value space
    Dropout(ut.tune(0.5, (0.2, 0.7))),
    # search activation with provided enumerate list
    Dense(1, activation=ut.autotune('softmax', ['sigmoid', 'softmax']))
    ])

model.compile(loss='categorical_crossentropy',
              optimizer=ut.autotune('sgd', ['adam', 'rmsprop', 'sgd', 'adadelta']),
              metrics=['accuracy'])
model.fit(x_train, y_train, epochs=20, batch_size=128)

# maximize classification accuracy on test dataset
score = ut.feedback(model.evaluate(x_test, y_test, batch_size=128),
                    objective='max')
```
Save the model and start tuning it with `uptune file.py [args for file.py] -pf 4 --timeout 36000`. UpTune will tune the model across 4 local threads until the time budget (in seconds) is exhausted. To execute the model with default values, run `python file.py [args for file]`

### User Interface Details 

Specify the tuning variables with either tuning APIs or non-intrusive annotation.

#### Tunable Variables Declaration

Call `autotune` API to specify the tuning range, and the tuning type (e.g. Integer, Real or Enumeration range will be inferred automatically). Notice that we do not support mixed declaration of tuning APIs and annotation approach. 

```python
from uptune import autotune

# tune integer `a` from 1 to 9, with default of 2
# optional arg 'name' is an identifier to track the var's tuning trend 
a = autotune(2, (1, 9), name='value')
b = autotune('On', ['On', 'Off', 'Auto'])
```

(Optional) UpTune also supports annonation based approach, which allows users to decalre tunable variables and their desired range in comments. The annotation based declaration should be wrapped in `{% %}` specifier, and can be either attched to the preceding line or in the same line where the variable is declared.

```python
# tune `depth` in an integer range from 0 to 2 with default value of 1
depth = 0 # {% depth=TuneInt(1, (0,2), 'name') %}

a = 1.7  # {% a=TuneFloat(1.7, (0.0,2.0)) %}
b = True # {% b=TuneBool(True, ()) %}
c = 'On' # {% c=TuneEnum('On', ['On', 'Off', 'Auto'], 'Mode') %}

```
Supported tuning modes include Boolean, Enumeration, Integer and Float, all with similar function signature. 

#### Return the QoR (Quality of Result) 

specify the return value that you want to maximize or minimize

```python
import uptune

# return real-value with uptune.feedback()
ret = uptune.feedback(a * 3, 'min')

# or sepcify the return value with uptune.save wrapper
@uptune.save('max')
def func(a, b, c):
    return a * 3

ret = func(a, b, c)
```

#### Run The Tuning

Pass the annotated python script into `uptune` with its own args followed by uptune args. 

```shell
uptune file.py [args] [uptune args]

# or use `python -m` command
python -m uptune.on file.py [args] [uptune args]
```

Examples of tuning python file with 4 parallel processes and XGBoost Regressor model for online pruning. 
```
uptune file.py -pf 4 -lm xgbregressor
```
The framework is extensible and allows users to plugin in machine learning models for space pruning.


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details


## Changelog

### TODO
  * Support RPC session for multi-platform communication
  * Support comment-out syntax in complement for TuneBool 

### 2019-07-21
  * Unified interface for controller initilization 
  * Added adaptive work dierctory selection on shared FS 
  * Added Amazon AWS support for cluster auto-tuning 

### 2019-05-30
  * Replaced message passing interface with file access
  * Added `__tmp__` to store template files 

### 2019-05-28
  * Fixed ZMQ msg encoding issue (in intrusive mode)
  * Updated XGBoost objective to squared error 
  * Incorporated single stage tuning into current flow  
  * Enabled automatic clean-up func before running 

### 2019-05-27
  * Resolved control conflicts of intrusive / template tuning  
  * Supported single/double quotes in regex value detection 
  * Migration to Python 3.7 

### 2019-05-21
  * Added support of decouple tuning 
  * Support real-time tuning result plotting 

### 2019-03-21
  * Added ResNet-18 Example for HeteroCL

### 2019-03-11
  * Introduced intrusive APIs for specifying tuning variable  
  * Added OS environment specifier for different tuning mode   
  * Added ZeroMQ framework for proposal distribution over cluster 

### 2019-03-02
  * Added README and basic use cases
  * Fixed Jinja tojson render error for Boolean vars with filter patch

### 2019-02-26
  * Added the objective declaration support in annotation  
  * Added report-api mapping mode and auto-test shell script for LAMBDA
  * Disabled `RUNNING` status in opentuner's desired result
  * Updated `cache` method of ML instance for re-training 

### 2019-02-21
  * Updated command line interface to suppotr mixed command and meta-parameter 
  * Updated learning models abstraction for re-training and parameterization  
  * Added multi-stage auto-tuning support based on fine-grained control logics
  * Added example of LAMBDA on Quartus LUT flow (for hybrid/online/vinilla mode) 
  * Added `tojson` filter to Jinja template render for string type

### 2019-02-18
  * Added HeteroCL schedule tuning example for BNN acceleration 
  * Added CLI clean mode (clean imtermediate files with "uptune clean")  
  * Update the regex pattern for accurate matching
  * Add support to limit process runtime (process killed if timeout)

### 2019-02-17 
  * Enabled Command Line Interface ("python -m uptune.on cmd" or "uptune cmd")
  * Added Jinja Template Engine for code generation on ray run() function
  * Added Template Parsing and Generation for auto-tuning and proposal assignment
  * Added fine-grained auto-tuning control APIs in api.py
  * Test and Error cases + Environment set-up scripts 
  * Added tuning data type template (TuneFloat + TuneResult)
  * Enabled Metaclass Mode for class registration

### 2019-02-09
  * Added tuning data type template (TuneInt + TuneEnum)
  * Added learning model support as modular plugins for search space pruning  

### 2018-12-17
  * Added support for calling function spawned in ThreadPool with time limit (defined by user)
  * Added EZTuner GCC benchamark(`gccflags/eztune.py`) over OpenTuner baseline(`gccflags.py`) 
  * Added Support for recording timing out results in global DB (for ML training) 

