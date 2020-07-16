import random, pickle
import copy
import pandas as pd
import xgboost as xgb
from uptune.plugins import models
from uptune.plugins.models import ModelBase
from sklearn.model_selection import train_test_split

class xgb_regressor(ModelBase):
    """ 
    meta-class for xgb_regressor model 
    """
    def __init__(self, name='xgb_regressor', interval=1):
        super(xgb_regressor, self).__init__(name, interval)
        self.storage = None  # pickle into stringio 

    def init(self, path, rate=0.025):
        """ 
        initialize model and do offline training 
        with $(rate)*total samples from self.data
        """
        self.data = pd.read_csv(path, header=None)

        # randomly pick samples from data
        count = len(self.data)
        skip = sorted(random.sample(range(count), int(count * (1-rate))))
        data = pd.read_csv(path, header=None, skiprows=skip).values 

        extract = [i for i in range(94)] + [-4]
        self.valids = data[:, extract]
        X = data[:, :94].astype(float)
        y = data[:, -4].astype(float)
 
        train_x, test_x, train_y, test_y = train_test_split(X, y, train_size=0.9, shuffle=True)
        self.model = xgb.XGBRegressor( objective = 'reg:squarederror',
                                       n_estimators=300,
                                       learning_rate= 0.015,
                                       max_depth=10,
                                       subsample=0.4,
                                       colsample_bylevel=0.5,
                                       reg_lambda=1 )
        
        eval_set = [ (train_x, train_y), (test_x, test_y) ]
        self.model.fit(train_x, train_y, eval_metric='rmse', eval_set=eval_set, verbose=False)
        self.storage = pickle.dumps(copy.deepcopy(self.model))

    def get_model(self):
        return self.name, self.model

    def inference(self, sample):
        """ 
        rebuild model if inference failure 
        return all-one score before model initialization 
        """
        assert len(sample) == 94, 'wrong length'
        try:
            prediction = self.model.predict(sample) if self.model else 1
            return prediction 
        except Exception as e:
            print("xgboost crashed %s" % e.message)
            model = pickle.loads(self.storage) 
            prediction = model.predict(sample)
            return prediction 

    def retrain(self):
        """ retrain model with self.valids """
        X = self.valids[:, :94].astype(float)
        y = self.valids[:, -1].astype(float)
 
        train_x, test_x, train_y, test_y = train_test_split(X, y, train_size=0.9, shuffle=True)
        self.model = xgb.XGBRegressor( objective = 'reg:squarederror',
                                       n_estimators=300,
                                       learning_rate= 0.015,
                                       max_depth=10,
                                       subsample=0.4,
                                       colsample_bylevel=0.5,
                                       reg_lambda=1 )
        
        eval_set = [ (train_x, train_y), (test_x, test_y) ]
        self.model.fit(train_x, train_y, eval_metric='rmse', eval_set=eval_set, verbose=False)
        self.storage = pickle.dumps(copy.deepcopy(self.model))
        
models.register_models(xgb_regressor())

