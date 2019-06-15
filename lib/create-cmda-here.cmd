@ECHO OFF
create-shortcut "cmda.lnk" "%ComSpec%" -wd "" -ra -a /k %~d0 ^& CD "%~dp0"
