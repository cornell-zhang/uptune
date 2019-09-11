# UpTune Project 

A Generic Distributed Auto-Tuning Infrastructure

## Getting Started

### Installation

Pull back the repo and install the package with `install` mode

```
git clone https://github.com/cornell-zhang/uptune.git
cd uptune; pip install -e . 
```
#### For MacOS users 
Please install gcc8 for XGBoost
```
brew install gcc@8
```

### Quick Start 
 
Here's a quick example to tune the hyperparameters in a Multilayer Perceptron (MLP) for improved classification accuracy. Import `uptune` package and declare the tunable variables using `var = ut.tune(default, range)`, then specify the return value with `ut.target(value, objective)`

```python
import uptune as ut
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation

model = Sequential([
    # search units on integer number space
    Dense(ut.tune(100, (50, 150)), input_shape=input_shape, activation='relu'),
    # search dropout rate on real value space
    Dropout(ut.tune(0.5, (0.2, 0.7))),
    # search activation with provided enumerate list
    Dense(1, activation=ut.tune('softmax', ['sigmoid', 'softmax']))
    ])

model.compile(loss='categorical_crossentropy',
              optimizer=ut.tune('sgd', ['adam', 'rmsprop', 'sgd', 'adadelta']),
              metrics=['accuracy'])
model.fit(x_train, y_train, epochs=20, batch_size=128)

# maximize classification accuracy on test dataset
score = ut.target(model.evaluate(x_test, y_test, batch_size=128),
                  objective='max')
```
Save the model and start tuning it with `uptune file.py [args for file.py] -pf 4 --timeout 36000`. UpTune will tune the model across 4 local threads until the time budget (in seconds) is exhausted. To execute the model with default values, run `python file.py [args for file]`

### User Interface Details 

Specify the tuning variables with either tuning APIs or non-intrusive annotation.

#### Tunable Variables Declaration

Call `ut.tune` API to specify the tuning range, and the tuning type (e.g. Integer, Real or Enumeration range will be inferred automatically). Notice that we do not support mixed declaration of tuning APIs and annotation approach. 

```python
import uptune as ut
# tune integer `a` from 1 to 9, with default of 2
# optional arg 'name' as variable identifier
a = ut.tune(2, (1, 9), name='int_range')
b = ut.tune(2.0, (1.0, 9.0), name='float_range')
c = ut.tune('On', ['On', 'Off', 'Auto'])
```

(Optional) UpTune also supports annonation based approach, which allows users to decalre tunable variables and their desired range in comments. The annotation based declaration should be wrapped in `{% %}` specifier, and can be either attched to the preceding line or in the same line where the variable is declared.

```python
# tune `depth` in an integer range from 0 to 2 with default value of 1
depth = 0 # {% depth=TuneInt(1, (0,2), 'name') %}

a = 1.7  # {% a=TuneFloat(1.7, (0.0, 2.0)) %}
b = True # {% b=TuneBool(True, ()) %}
c = 'On' # {% c=TuneEnum('On', ['On', 'Off', 'Auto'], 'Mode') %}

```
Supported tuning modes include Boolean, Enumeration, Integer and Float, all with similar function signature. 

#### Return the QoR (Quality of Result) 

specify the return value that you want to maximize or minimize

```python
import uptune as ut

# return real-value with uptune.target()
ret = ut.target(a * 3, 'min')

# or return with ut.save decorator
@ut.save('max')
def func(a, b, c):
    return a * 3

ret = func(a, b, c)
```

#### Run The Tuning

Pass the annotated python script into `uptune` with its own args followed by uptune args. 

```shell
uptune file.py [args] [uptune-args]

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
