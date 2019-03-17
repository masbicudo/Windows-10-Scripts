call require app/choco.cmd
choco install -y python3 --params "/InstallDir:C:\Python\Python37"
python -m pip install --upgrade pip
pip install pandas
pip install matplotlib
pip install sklearn

:: xgboost
choco install -y vcredist140
:: TODO: download http://ssl.picnet.com.au/xgboost/20190212/x64/xgboost.dll
:: TODO: download http://ssl.picnet.com.au/xgboost/20190207/x64_gpu/xgboost.dll
:: TODO: git clone https://github.com/dmlc/xgboost.git xgboost_install_dir
:: TODO: copy xgboost.dll xgboost_install_dir\python-package\xgboost\
:: TODO: cd xgboost_install_dir\python-package\
:: TODO: python setup.py install
