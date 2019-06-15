:: set-many.cmd
:: Clears all variables strating with a given string
:: Example:
::  set-many __
::    will clear all variables starting with "__"
::  set-many "foo." 0
::    set everything starting with "foo." to 0
@ECHO OFF
for /f "tokens=1 usebackq delims==" %%a in (` set %1 `) do @set %%a=%2
