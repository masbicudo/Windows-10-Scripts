call require places.cmd

:: This is the setup file for PowerShell
set "where_posh=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

shortcut-create "%where_shortcuts%\posh.lnk"   "%where_posh%" -wd ""
shortcut-create "%where_shortcuts%\posha.lnk"  "%where_posh%" -wd "" -ra

shortcut-create "%where_shortcuts%\poshc.lnk"  "%where_posh%" -wd ""     -a -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command
shortcut-create "%where_shortcuts%\poshca.lnk" "%where_posh%" -wd "" -ra -a -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command
