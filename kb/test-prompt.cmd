@ECHO OFF
SETLOCAL
call set-colors
SET /P proceed=Would you like to proceed? %Y%[Y]es/[N]o (default=N)%N%: %W%
IF /I NOT [%proceed%] == [y] GOTO :EOF
ECHO %B%Proceeding%N%