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
  SET LK=[90m&SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&SET N=[0m
  SET DK=[30m&SET DR=[31m&SET DG=[32m&SET DY=[33m&SET DB=[34m&SET DM=[35m&SET DC=[36m&SET DW=[37m

  SET "arg_1=%1"
  SET "arg_1=%arg_1:"=%"
  SET __HELP=
  if "%arg_1%"=="" SET __HELP=1
  if "%arg_1%"=="?" SET __HELP=1
  if "%arg_1%"=="/?" SET __HELP=1
  if /I "%arg_1%"=="-h" SET __HELP=1
  if /I "%arg_1%"=="--help" SET __HELP=1
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
  SET __TO_REMOVE=
  :parse_args
  SET "arg_1=%1"
  if not defined arg_1 goto :end_args
  SET "arg_1=%arg_1:"=%"
  if "%arg_1%"=="" goto :end_args
  if /I "%arg_1%"=="-s" SET "__SIMULATE=1" & goto :next_arg
  if /I "%arg_1%"=="--simulate" SET "__SIMULATE=1" & goto :next_arg
  if defined __TO_REMOVE SET "__TO_REMOVE=%__TO_REMOVE%;%1"
  if not defined __TO_REMOVE SET "__TO_REMOVE=%1"
  :next_arg
  shift
  goto :parse_args
  :end_args

  SET __VAR__=Path
  REM echo __SIMULATE=%__SIMULATE%
  REM echo __TO_REMOVE=%__TO_REMOVE%
  REM goto :eof
  call :normalize __TO_REMOVE

  SET "__type=local"
  CALL SET "__COPY=%%%__VAR__%%%"
  call :normalize __COPY
  call :remove_from_list __COPY

  SET "__type=machine"
  SET "__KEY=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
  call :read_reg __REG_SYS_VAR %__VAR__%
  REM echo __REG_SYS_VAR=%__REG_SYS_VAR%
  call :normalize __REG_SYS_VAR
  call :remove_from_list __REG_SYS_VAR

  SET "__type=user"
  SET "__KEY=HKCU\Environment"
  call :read_reg __REG_USER_VAR %__VAR__%
  call :normalize __REG_USER_VAR
  call :remove_from_list __REG_USER_VAR

  :: keep writes at the end, to prevent corruption due to batch script failure
  :: ensure the following were not removed by accident
  :: - %SystemRoot%\system32
  :: - %SystemRoot%
  :: - %SystemRoot%\System32\Wbem
  :: - %SYSTEMROOT%\System32\WindowsPowerShell\v1.0\
  :: - %SYSTEMROOT%\System32\OpenSSH\
  set __write=1
  if not defined __REG_SYS_VAR set __write=0
  set "__test=;%__REG_SYS_VAR:"=%;"
  if /I "!__test:;%%SystemRoot%%\system32;=;!"=="%__test%" set __write=0
  if /I "!__test:;%%SystemRoot%%;=;!"=="%__test%" set __write=0
  if /I "!__test:;%%SystemRoot%%\System32\Wbem;=;!"=="%__test%" set __write=0
  if /I "!__test:;%%SYSTEMROOT%%\System32\WindowsPowerShell\v1.0\;=;!"=="%__test%" set __write=0
  if /I "!__test:;%%SYSTEMROOT%%\System32\OpenSSH\;=;!"=="%__test%" set __write=0
  if "%__write%"=="1" (
    SET "__KEY=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
    call :write_reg_path __REG_SYS_VAR
  ) else (
    echo.%R%Error: cannot remove default system entries%N%
  )
  SET "__KEY=HKCU\Environment"
  call :write_reg_path __REG_USER_VAR

  EndLocal & IF not "%__SIMULATE%"=="1" SET "%__VAR__%=%__COPY%"

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
    if defined __SIMULATE ( set "__msg=%LK%would remove" ) else set "__msg=%DR%removed"
    for %%b in (%__TO_REMOVE%) do (
      if %%b neq "" (
        SET "_TEMP=!_TEMP:%%~b=%Y%%%~b%W%!"
      )
    )
    :: protecting machine level entries defined by the system
    set __sysentry=0
    if /I "%__type%"=="machine" (
      if /I "%_INPUT%"=="%%SystemRoot%%\system32" set __sysentry=1
      if /I "%_INPUT%"=="%%SystemRoot%%" set __sysentry=1
      if /I "%_INPUT%"=="%%SystemRoot%%\System32\Wbem" set __sysentry=1
      if /I "%_INPUT%"=="%%SYSTEMROOT%%\System32\WindowsPowerShell\v1.0\" set __sysentry=1
      if /I "%_INPUT%"=="%%SYSTEMROOT%%\System32\OpenSSH\" set __sysentry=1
    )
    set __add=0
    set __selected=1
    if "%__sysentry%"=="1" set __add=1
    IF /I "%_INPUT%"=="%_TEMP%" set __add=1& set __selected=0
    if "%__selected%"=="1" if "%__sysentry%"=="1" echo %R%cannot remove from %__type% %__VAR__%: %W%"%_TEMP%"%N%
    if "%__add%"=="1" (
      IF defined _RESULT (
        SET "_RESULT=%_RESULT%;%_INPUT%"
      ) ELSE (
        SET "_RESULT=%_INPUT%"
      )
    ) else (
      echo %__msg% from %__type% %__VAR__%: %W%"%_TEMP%"%N%
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
