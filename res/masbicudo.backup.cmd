@echo off
setlocal enabledelayedexpansion

set "yyyy-mm=%%%%year%%%%-%%%%month%%%%"

call :do_backup "D:\Fotos-Videos-Pessoais" "%~d0\data\media-nb-dell" %yyyy-mm%
call :do_backup "D:\Backups" "%~d0\data\backups" %yyyy-mm%
call :do_backup "D:\Games\StandAlone\Descent" "%~d0\data\games\descent" %yyyy-mm%

:pauseIfDoubleClicked
:: reference: https://stackoverflow.com/questions/5859854/detect-if-bat-file-is-running-via-double-click-or-from-cmd-window
:: If the batch script file name is at the command line used to launch
:: the terminal, then it means that it was meant to run only this script
:: and then exit. In this case we need to PAUSE the script before exiting.
:: There are some situation though, in which the script name is at the
:: command line to open the terminal, but exiting will actually keep
:: the terminal open. This happens when there are multiple levels of
:: terminal programs executed one inside the other. In this case, we
:: can use environment variables to try to detect this.
setlocal enabledelayedexpansion
set __cmdline=%cmdcmdline:"=%
set __cmdline_wo_filename=!__cmdline:%~nx0=!
if "%__cmdline%" == "%__cmdline_wo_filename%" goto :eof
if not "%MSYSTEM%" == "" goto :eof
pause
goto :eof
:do_backup

setlocal enabledelayedexpansion

:: reference: http://schinagl.priv.at/nt/ln/ln.html
set "LN=%~d0\tools\ln64\ln.exe"

:: reference: https://stackoverflow.com/questions/203090/how-do-i-get-current-date-time-on-the-windows-command-line-in-a-suitable-format
for /f %%# in ('wmic Path Win32_LocalTime Get /Format:value') do for /f %%@ in ("%%#") do set %%@
call :fill_zero Milliseconds 3 %Milliseconds%
call :fill_zero Month 2 %Month%
call :fill_zero Day 2 %Day%
call :fill_zero Hour 2 %Hour%
call :fill_zero Minute 2 %Minute%
call :fill_zero Second 2 %Second%

set __src=%~dpnx1
if not exist %2 mkdir %2
pushd %2
if exist "bkp_vars.cmd" call bkp_vars.cmd
if not "%~3" == "" goto :custom_format
  set __dst=%year%-%month%
  if exist %__dst% set __dst=%__dst%-%day%
  if exist %__dst% set __dst=%__dst%T%hour%-%minute%-%second%
  goto :end_format
:custom_format
  call set "__dst=%~3"
:end_format

set __replace=
if exist %__dst% (
  set COMMAND=%LN% --backup --mirror "%__src%" "%__dst%"
  set __replace=T
) else if defined __base (
  set COMMAND=%LN% --backup --delorean "%__src%" "%__base%" "%__dst%"
) else (
  set COMMAND=%LN% --backup --copy "%__src%" "%__dst%"
)
FOR /F "tokens=* USEBACKQ" %%F IN (`ver`) DO SET ver=%%F
if not exist %__dst%.txt type nul > %__dst%.txt

set PRINT=powershell -Command "$input | Add-Content %__dst%.txt -Passthru"

(
  echo.# Backup started
  echo.# ==============
  echo.#
  echo.# Command Line=%COMMAND%
  echo.# Source=%__src%
  if defined __base echo.# Base=%__base%
  echo.# Destination=%__dst%
  echo.# Date and Time=%year%-%month%-%day%T%hour%:%minute%:%second%.%milliseconds%Z
  echo.# Computer Name=%COMPUTERNAME%
  echo.# User Name=%USERNAME%
  echo.# Operating System=%ver%
  echo.
)>>%__dst%.txt

:: reference - prevent system sleep in batch script - https://superuser.com/questions/90415/prevent-sleep-in-scripts
if exist %WINDIR%\System32\PresentationSettings.exe %WINDIR%\System32\PresentationSettings.exe "/start"
:: reference - piping stdout to powershell command - https://superuser.com/questions/829776/how-to-use-powershell-command-in-cmd-pipe/829778
:: reference - redirecting output to screen and file - https://stackoverflow.com/questions/30606929/tee-with-utf-8-encoding
%COMMAND% | %PRINT%
if exist %WINDIR%\System32\PresentationSettings.exe %WINDIR%\System32\PresentationSettings.exe "/stop"

if not defined __replace (
  if exist "bkp_vars.cmd" (
    echo.set "__base=%__dst%">> bkp_vars.cmd
  ) else (
    echo.set "__base=%__dst%"> bkp_vars.cmd
  )
)
if exist "%__dst%" (
  pushd "%__dst%"
    echo.Removing empty folders from "%__dst%"
    for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d" 2>nul
  popd
) else (
  echo.Removing empty folders error: could not find "%__dst%"
)

(
  echo.
  echo.
)>>%__dst%.txt
popd

goto :eof
:fill_zero
:: reference: https://stackoverflow.com/questions/9430642/win-bat-file-how-to-add-leading-zeros-to-a-variable-in-a-for-loop
set "formattedValue=0000000000000000000000000000000000000000000000000000000000000000%3"
set %1=!formattedValue:~-%2!