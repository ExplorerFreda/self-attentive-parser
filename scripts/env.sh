conda create -n python36 python=3.6
source activate python36
conda install Cython=0.25.2
conda install pytorch=1.1.0 torchvision cudatoolkit=10.0 -c pytorch
pip install pytorch-pretrained-bert==0.4.0
