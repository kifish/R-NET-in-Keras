~/anaconda3/bin/conda create -n R-NET-in-Keras python=2.7
source ~/anaconda3/bin/activate
conda activate R-NET-in-Keras
conda install tensorflow-gpu=1.10.0
#conda install -c anaconda keras=2.0.6 # 指定channel为anaconda
pip install keras==2.0.6
# Successfully installed keras-2.0.6 pyyaml-5.3 scipy-1.2.3 theano-1.0.4
conda install gensim # 3.8.0
pip install tqdm
pip install unidecode

# Using TensorFlow backend.

cd your_directory
git clone https://github.com/brendano/stanford_corenlp_pywrapper
cd stanford_corenlp_pywrapper
pip install .

#https://anaconda.org/anaconda/openjdk

conda install -c anaconda openjdk
#java -version
#openjdk version "1.8.0_152-release"
#OpenJDK Runtime Environment (build 1.8.0_152-release-1056-b12)
#OpenJDK 64-Bit Server VM (build 25.152-b12, mixed mode)


pip install h5py
