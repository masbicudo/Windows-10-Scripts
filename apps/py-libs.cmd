call require apps\choco.cmd
call require apps\python.cmd

conda config --add channels intel

conda install -y numpy
conda install -y sympy
conda install -y matplotlib
conda install -y scikit-learn
conda install -y py-xgboost
conda install -y pandas

choco install -y graphviz
pip install graphviz
