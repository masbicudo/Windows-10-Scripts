@echo off
:: Deferring a command means that it will be executed only in the last
:: stage of execution of the entire setup script. Any script that takes
:: the responsibility for the setup, must create a temp ".cmd" file and
:: set __deferred_exec_file__ variable pointing to that file.

:: defer-context.cmd will take care of creating the temp file,
:: set the variable, call the given setup command and finally run the
:: deferred script, and delete the temp file.

set "__deferred_exec_file__=%tmp%\%random%.%random%.%random%.%random%.cmd"
if exist "%__deferred_exec_file__%" del "%__deferred_exec_file__%" /F /Q
copy /Y nul "%__deferred_exec_file__%"
call %*
call "%__deferred_exec_file__%"
del "%__deferred_exec_file__%" /F /Q
set __deferred_exec_file__=
