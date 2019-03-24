call require apps\choco.cmd

choco install -y miniconda3 --params="'/AddToPath:1 /RegisterPython:1 /D:%SystemDrive%\miniconda3 /InstallationType:AllUsers'"
conda update -y conda

::choco install -y python3 --params "/InstallDir:C:\Python\Python37"
::python -m pip install --upgrade pip
