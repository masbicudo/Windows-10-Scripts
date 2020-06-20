@echo off
tasklist /FI "IMAGENAME eq VirtualBox.exe" 2>NUL | find /I /N "VirtualBox.exe">NUL
if "%ERRORLEVEL%"=="0" ( SET "__VBoxWasRunning=1" ) else ( SET "__VBoxWasRunning=0" )
taskkill /F /IM VirtualBoxVM.exe
if "%__VBoxWasRunning%"=="1" start VirtualBox.exe
