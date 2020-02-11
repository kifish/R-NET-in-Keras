CUDA_VISIBLE_DEVICES='' python parse_data.py data/train-v1.1.json --train_ratio 0.9 --outfile data/train_parsed.json --outfile_valid data/valid_parsed.json
CUDA_VISIBLE_DEVICES='' python parse_data.py data/dev-v1.1.json --outfile data/dev_parsed.json


CUDA_VISIBLE_DEVICES='' python preprocessing.py data/train_parsed.json --outfile data/train_data_str.pkl --include_str
# wait......
CUDA_VISIBLE_DEVICES='' python preprocessing.py data/valid_parsed.json --outfile data/valid_data_str.pkl --include_str
# wait......
CUDA_VISIBLE_DEVICES='' python preprocessing.py data/dev_parsed.json --outfile data/dev_data_str.pkl --include_str
# wait......

# ensure gpu
# https://www.tensorflow.org/guide/gpu (tf2.0+)
#from keras import backend as K

# import tensorflow as tf
# tf.debugging.set_log_device_placement(True)
# Create some tensors
#a = tf.constant([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])
#b = tf.constant([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
#c = tf.matmul(a, b)

#print(c)


# tf1.0+
#import tensorflow as tf
#tf.Session()
# 2020-02-01 07:33:05.774507: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1484] Adding visible gpu devices: 0, 1, 2, 3, 4, 5, 6, 7


# train
CUDA_VISIBLE_DEVICES=4,5,6,7 python train.py --hdim 45 --batch_size 50 --nb_epochs 50 --optimizer adadelta --lr 1 --dropout 0.2 --char_level_embeddings --train_data data/train_data_str.pkl --valid_data data/valid_data_str.pkl

# predict
CUDA_VISIBLE_DEVICES=1 python predict.py --batch_size 100 --dev_data data/dev_data_str.pkl models/48-t2.87726693154-v3.31278041139.model prediction.json
# evaluate
CUDA_VISIBLE_DEVICES='' python evaluate.py data/dev-v1.1.json prediction.json