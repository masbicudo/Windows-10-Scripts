call require apps\choco.cmd

call require choco.exe upgrade -y gridmove

setlocal

SET "where_gm_grids=%ProgramFiles(x86)%\GridMove\Grids"
if not exist "%where_gm_grids%" goto :eof

copy "%~dp0\..\res\gridmove\*" "%where_gm_grids%\" /Y

call set-where where_gridmove gridmove

shortcut-create "%where_shortcuts%\gm.lnk" "%where_gridmove%"
shortcut-create "%where_shortcuts%\gma.lnk" "%where_gridmove%" -ra

del "%where_startup%\GridMove.lnk"

:: maybe it would be better to use VBScript to create the task
:: it can control more paramenters of the created task:
:: https://stackoverflow.com/questions/19522094/how-do-you-set-a-task-to-run-as-the-current-user-at-logon-using-vbs-without-admi

SCHTASKS /DELETE /TN "\GridMove" /F
SCHTASKS /CREATE /SC ONLOGON /TN "\GridMove" /TR "\"%where_gridmove%\"" /RL HIGHEST /F
