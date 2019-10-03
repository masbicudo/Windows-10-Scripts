@echo off
setlocal enabledelayedexpansion

set "yyyy-mm=%%%%year%%%%-%%%%month%%%%"

call :do_backup "D:\Fotos-Videos-Pessoais" "%~d0\data\media-nb-dell" %yyyy-mm%

:pauseIfDoubleClicked
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
call :fill_zero Milliseconds 6 %Milliseconds%
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
  echo.__dst=%__dst%
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
echo.%COMMAND%
%COMMAND%
if not defined __replace (
  if exist "bkp_vars.cmd" (
    echo.set "__base=%__dst%">> bkp_vars.cmd
  ) else (
    echo.set "__base=%__dst%"> bkp_vars.cmd
  )
)
pushd "%__dst%"
echo.Removing empty folders
for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"
popd
popd
goto :eof
:fill_zero
:: reference: https://stackoverflow.com/questions/9430642/win-bat-file-how-to-add-leading-zeros-to-a-variable-in-a-for-loop
set "formattedValue=0000000000000000000000000000000000000000000000000000000000000000%3"
set %1=!formattedValue:~-%2!