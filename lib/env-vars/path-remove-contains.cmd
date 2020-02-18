:: path-remove-contains v0.1.0-beta by MASBicudo
::
:: Removes items from Path environment variable where the item
:: contains one of the listed strings.
::
:: Example:
::   path-remove-contains ^%windir^%\;"Program Files"
::
:: #List of substrings
::   Each string must be separated by semicolon character ';'.
::   If the substring contains special characters such as space ' ',
::   parentheses '(' or ')', and some other, it must be enclosed
::   in double quotes. e.g. "Program Files (x86)"
::
:: #Simulated run
::   Simulating is useful to get the list of entries that would
::   be removed, before doing the real operation.
::
::   Example:
::     path-remove-contains --simulate ^%windir^%\;"Program Files"
::     path-remove-contains -s ^%windir^%\;"Program Files"
::

:Header
  @echo off
  setlocal EnableDelayedExpansion
  SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&SET N=[0m
  SET "arg_1=%1"
  SET "arg_1=%arg_1:"=%"
  if "%arg_1%"=="" SET __HELP=1
  if "%arg_1%"=="/?" SET __HELP=1
  if "%arg_1%"=="-h" SET __HELP=1
  if "%arg_1%"=="--help" SET __HELP=1
  if not defined __HELP goto :no_help
  set text_color=%W%
  for /f "delims=" %%a in (%~dpnx0) do (
      set __=%%a
      IF not "!__:~0,2!"=="::" goto :eof
      set "__=!__:~3!"
      if not defined __ (
        echo.
      ) else (
        if not defined not_first_line (
          call :find_ver
          call set "__=%%__:v!__ver!=%M%v!__ver!%N%%%"
        )
        call set "__=%%__:!__prog_name!=%B%!__prog_name!%Y%%%"
        set "__=!__:Example:=%G%Example:%N%!"
        set "__=!__:#=%W%!"
        if not "!__:Example:=!"=="!__!" set text_color=%N%
        echo.!text_color!!__!%N%
      )
      set not_first_line=1
  )
  goto :eof
  :find_ver
    set __prog_name=
    for %%s in ("!__: =";"!") do (
      if not defined __prog_name set "__prog_name=%%~s"
      set "__str=%%s"
      rem echo !__str!:EOL
      for /f "usebackq" %%v in (` echo.!__str!:EOL ^| findstr /r "^.[0-9][0-9]*\.[0-9][0-9]*[-\.a-zA-Z]*.:EOL" `) do (
        set "__ver=%%v"
        set "__ver=!__ver:~2,-5!"
        rem echo !__ver!
        goto :eof
      )
    )
  goto :eof
  :no_help

:Main
  SET __VAR__=Path
  SET "__TO_REMOVE=%*"
  if "%arg_1%"=="-s" SET __SIMULATE=1
  if "%arg_1%"=="--simulate" SET __SIMULATE=1
  IF defined __SIMULATE FOR /f "tokens=1*delims= " %%a IN ("%*") DO set "__TO_REMOVE=%%b"
  ::echo __SIMULATE=%__SIMULATE%
  ::echo __TO_REMOVE=%__TO_REMOVE%
  call :normalize __TO_REMOVE

  SET "__src_name=local %__VAR__%"
  CALL SET "__COPY=%%%__VAR__%%%"
  call :normalize __COPY
  call :remove_from_list __COPY

  SET "__src_name=machine %__VAR__%"
  SET "__KEY=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
  call :read_reg __REG_SYS_VAR %__VAR__%
  call :normalize __REG_SYS_VAR
  call :remove_from_list __REG_SYS_VAR
  call :write_reg_path __REG_SYS_VAR

  SET "__src_name=user %__VAR__%"
  SET "__KEY=HKCU\Environment"
  call :read_reg __REG_USER_VAR %__VAR__%
  call :normalize __REG_USER_VAR
  call :remove_from_list __REG_USER_VAR
  call :write_reg_path __REG_USER_VAR

  EndLocal & IF not defined __SIMULATE SET "%__VAR__%=%__COPY%"

  goto :EOF
  :read_reg
    SET %1=
    FOR /F "usebackq tokens=2,* skip=2" %%L IN (
        `reg query "%__KEY%" /v %2 2^>nul`
    ) DO SET %1=%%M 2>nul
    IF defined %1 CALL SET %1=%%%1:~0,-1%%
  goto :EOF
  :normalize
    :: ref: https://stackoverflow.com/questions/5471556/pretty-print-windows-path-variable-how-to-split-on-in-cmd-shell
    setlocal DisableDelayedExpansion
    CALL set "var=%%%1%%"
    set "var=%var:"=""%"
    set "var=%var:^=^^%"
    set "var=%var:&=^&%"
    set "var=%var:|=^|%"
    set "var=%var:<=^<%"
    set "var=%var:>=^>%"
    set "var=%var:;=^;^;%"
    set var=%var:""="%
    set "var=%var:"=""Q%"
    set "var=%var:;;="S"S%"
    set "var=%var:^;^;=;%"
    set "var=%var:""="%"
    set "var=%var:"Q=%"
    set "var=%var:"S"S=";"%"
    endlocal & set "%1="%var%""
  goto :EOF
  :remove_from_list
    setlocal
    set _RESULT=
    call set "_SRC=%%%1%%"
    for %%a in (%_SRC%) do (
      if %%a neq "" (
        set "_INPUT=%%~a"
        call :append_to_result
      )
    )
    endlocal & set "%1=%_RESULT%"
  goto :EOF
  :append_to_result
    SET "_TEMP=%_INPUT%"
    if defined __SIMULATE ( set "__msg=would remove" ) else set "__msg=removed"
        ::echo __TO_REMOVE=%__TO_REMOVE%
    for %%b in (%__TO_REMOVE%) do (
      if %%b neq "" (
        SET "_TEMP=!_TEMP:%%~b=%Y%%%~b%W%!"
      )
    )
    IF "%_INPUT%"=="%_TEMP%" (
      IF defined _RESULT (
        SET "_RESULT=%_RESULT%;%_INPUT%"
      ) ELSE (
        SET "_RESULT=%_INPUT%"
      )
    ) else (
      echo %R%%__msg% from %__src_name%: %W%"%_TEMP%"%N%
    )
  goto :EOF
  :write_reg_path
    CALL SET "_RESULT=%%%1%%"
    REM IF _RESULT ENDS WITH "\", MUST DOUBLE IT (e.g. "\\")
    IF "%_RESULT:~-1%"=="\" (
        IF not defined __SIMULATE REG ADD "%__KEY%" /v %__VAR__% /t REG_EXPAND_SZ /f /d "%_RESULT:~0,-1%\\" > nul
    ) ELSE (
        IF not defined __SIMULATE REG ADD "%__KEY%" /v %__VAR__% /t REG_EXPAND_SZ /f /d "%_RESULT%" > nul
    )
