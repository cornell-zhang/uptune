# -*- coding: utf-8 -*-
# This file is used to test all the models in the model database and generate result database.
import os
import pickle
import sys
import argparse
import numpy as np

#add examples and default values
pkg_dir = os.path.dirname(os.path.abspath(__file__))
parser = argparse.ArgumentParser()
parser.add_argument('--data_dir', type=str, 
                    default = pkg_dir + '/data/data_test.pkl', 
                    help = 'Directory or file of the testing dataset. \
                    String. Default: ./data/data_test.pkl')

parser.add_argument('--models_save_dir', type=str, 
                    default= pkg_dir + '/saves/train/models_save.pkl', 
                    help='Directory or file of the pre-trained models. \
                    String. Default: ./train/models_save.pkl')

parser.add_argument('--save_result_dir', type=str, 
                    default= pkg_dir + '/saves/test/results.pkl', 
                    help='Directory or file to save the result. \
                    String. Default: ./saves/test/results.pkl')


def load_data(FLAGS, silence=False):
    """
    Load testing dataset.
    """
    if not silence: print('Load data from: ', FLAGS.data_dir)
    
    if not os.path.exists(FLAGS.data_dir):
        sys.exit("Data file " + FLAGS.data_dir + " does not exist!")
        
    with open(FLAGS.data_dir, "rb") as f:
        data = pickle.load(f)  
        
    # unpack the data
    X = data['x']
    Y = data['y']
#    design_index = data['desii']
#    device_index = data['devii']
    feature_name = data['fname']
    target_name = data['tname']
    mean_features = data['fmean']
    mean_targets = data['tmean']
    std_features = data['fstd']
    std_targets = data['tstd']
    
    return X, Y, mean_features, mean_targets, std_features, std_targets, \
           feature_name, target_name


def load_model_db(FLAGS, silence=False):
    """
    Load model database.
    """
    if not silence: print('Load model from: ', FLAGS.models_save_dir)
    
    if not os.path.exists(FLAGS.models_save_dir):
        sys.exit("Model file " + FLAGS.models_save_dir + " does not exist!")
        
    with open(FLAGS.models_save_dir, "rb") as f:
        model_db = pickle.load(f)  
        
    return model_db


def save_result_db(result_db, FLAGS, silence=False):
    """
    Save the result database.
    """
    # input file name
    file_dir, file_name = os.path.split(FLAGS.save_result_dir)
    if file_dir == '': file_dir = "./saves/test/"
    if file_name == '': file_name = 'results.pkl'
    file_path = os.path.join(file_dir, file_name)
    
    # create folder
    if not os.path.exists(file_dir):
        os.mkdir(file_dir)
        
    # save
    pickle.dump(result_db, open(file_path, 'wb'))
    
    if not silence: print("Save results to: ", file_path)


def test_models(model_db, X, Y, silence=False):
    """
    Test model.
    --------------
    Parameters:
        model_db: The model database. All the models in the database will the tested.
        X: Feature dataset.
        Y: Target dataset. 
    --------------
    Return:
        result_db: The result database.
    """
    global Feature_Names, Target_Names
    
    # test model
    result_db = {}
    for name in model_db.keys():
        result_db[name] = {}
        for ii in range(0, len(Target_Names)):
            target = Target_Names[ii]
            x = X
            y = Y[:, ii]
            
            # run model
            predict = model_predict(name, model_db[name][target], x)
            
            # data to save
            result_db[name][target] = {'Pre': predict,
                                       'Truth': y}
    
    # return 
    return result_db


def model_predict(model_name, packed_model, X):
    """
    Use model to predict the target.
    --------------
    Parameters:
        model_name: Name of the model. It controls how to run the model.
        packed_model: The model to predict.
        X: The predicting features.
    --------------
    Return:
        predict: The predicted results.
    """
    # data to return
    predict  = None
    
    # which model
    if model_name == 'single' or model_name == 'xgb' or model_name == 'lasso':
        # load model info
        model = packed_model['model']
        features = packed_model['fselect']
        
        # predict
        predict = model.predict(X[:, features])
        
    elif model_name == 'xgb+lasso+equal_weights':
        # load model info
        models = packed_model['models']
        weights = packed_model['weights']
        
        # predict
        predict = None
        weight_sum = 0.0
        for tt in range(len(models)):
            p = model_predict('single', models[tt], X)
            weight_sum += weights[tt]
            if predict is None:
                predict = p * weights[tt]
            else:
                predict += p * weights[tt]
        
        # weights
        predict /= weight_sum
        
    elif model_name == 'xgb+lasso+learn_weights':
        # load model info
        models = packed_model['models']
        model_weights = packed_model['weights']
        
        # predict
        predicts = []
        weight_sum = 0.0
        for tt in range(len(models)):
            p = model_predict('single', models[tt], X)
            predicts.append(p)
            
        # weights
        predict = model_weights.predict(np.array(predicts).T)
        
    # return 
    predict = predict.astype(float)
    return predict
    

def test():
    """
    Test dataset with ground truth.
    --------------
    Parameters:
        X: The predicting features.
    --------------
    Return:
        predict: The predicted results.
    """
    global Feature_Names, Target_Names
    
    # parser
    FLAGS, unparsed = parser.parse_known_args()
    
    # print info
    print("\n========== Start testing models ==========\n")
    
    # load testing data
    X, Y, mean_features, mean_targets, std_features, std_targets, \
        Feature_Names, Target_Names, = load_data(FLAGS)
    
    # load model
    model_db = load_model_db(FLAGS)
    
    # train models
    result_db = test_models(model_db, X, Y)
    
    # save results
    save_result_db(result_db, FLAGS)
    
    # print HLS result
    # test_data(X, Y, mean_features, mean_targets, std_features, std_targets)
    
    print("\n========== End ==========\n")

# put design error and scores to analyze


def predict(feats, target='LUT_impl'):
    """
    predict the resoure.
    --------------
    Parameters:
        feats: The predicting features.
    --------------
    Return:
        predict: The predicted results.
    """
    # parser
    FLAGS, unparsed = parser.parse_known_args()
    
    # load model
    model_db = load_model_db(FLAGS)
    
    # test model
    result_db = {}
    for name in model_db.keys():
        result_db[name] = {}
        ii = Target_Names.index(target)
        target = Target_Names[ii]
        
        # run model
        assert feats.shape == (1, 234), "feats num wrong"
        predict = model_predict(name, model_db[name][target], feats)

    return predict
    
