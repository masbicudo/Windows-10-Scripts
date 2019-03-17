:: clear-env-vars
::
:: Clears a list of variables from multiple locations.
:: Locations can be:
::  /SYSTEM
::  /USER
::  /LOCAL
::
:: Example:
::  clear-env-vars /u PATHEXT

@echo off
setlocal EnableDelayedExpansion
:LOOP
if "%~1" NEQ "" (
  IF /i "%~1"=="/SYSTEM" (         SET __CLEAR_SYS=1
  ) ELSE IF /i "%~1"=="/USER" (    SET __CLEAR_USR=1
  ) ELSE IF /i "%~1"=="/LOCAL" (   SET __CLEAR_LOCAL=1
  ) ELSE IF /i "%~1"=="/S" (       SET __CLEAR_SYS=1
  ) ELSE IF /i "%~1"=="/U" (       SET __CLEAR_USR=1
  ) ELSE IF /i "%~1"=="/L" (       SET __CLEAR_LOCAL=1
  ) ELSE (                      call list-insert-item __temp %1
  )
  SHIFT
  goto :LOOP
)

FOR /F "delims=;" %%A in ("%__temp%") do (
  IF "%__CLEAR_SYS%"=="1" REG delete HKCU\Environment /F /V %%A >nul 2>&1
  IF "%__CLEAR_USR%"=="1" REG delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V %%A >nul 2>&1
  IF "%__CLEAR_LOCAL%"=="1" SET "__CLS_LOCAL=!__CLS_LOCAL!^& SET %%A="
)

endlocal %__CLS_LOCAL%