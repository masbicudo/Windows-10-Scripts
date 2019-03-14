:: eat.cmd
:: This will eat the first argument passed
:: and echo everything else
:: Example:
::    eat one two three -> two three
@ECHO OFF
SETLOCAL
shift
set __=
:start
  if [%1] == [] goto done
  (set __ 2>nul 1>nul) && (
    set __=%__% %1
  ) || (
    set __=%1
  )
  shift
goto start

:done
ECHO %__%