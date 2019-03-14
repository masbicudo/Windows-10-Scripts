:: array-load.cmd
:: Loads an array from a file containing one item per line,
:: and appends each item to the end of the given array.
:: Example:
:: _file_
::    Some string
::    Another string
:: array-load msg _file_
:: set msg
::    msg.length=2
::    msg[1]="Some string"
::    msg[2]="Another string"
@ECHO OFF
IF NOT DEFINED %1.length SET %1.length=0
FOR /F "delims=" %%a IN ('TYPE "%2"') DO (
    SET /a %1.length+=1
    CALL :Set_Item %1 "%%~a"
)
GOTO :EOF
:Set_Item
CALL SET "%1[%%%1.length%%]=%2"
