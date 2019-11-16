@echo off
:: Deferring a command means that it will be executed only in the last
:: stage of execution of the entire setup script. Any script that takes
:: the responsibility for the setup, must create a temp ".cmd" file and
:: set __deferred_exec_file__ variable pointing to that file.

:: deferred.cmd will write the command to the given target file,
:: or ignore the command if the variable is not defined.

if not defined __deferred_exec_file__ (
    echo Cannot defer: %*
    goto :eof
)
echo call %*>> %__deferred_exec_file__%
