call require apps\choco.cmd
choco install -y git --params "/GitAndUnixToolsOnPath"

call set-where where_git git
call set-where where_gitbash bash --filter git

shortcut-create "%where_shortcuts%\gitbash.lnk" "%where_gitbash%" -wd "."
shortcut-create "%where_shortcuts%\gitbasha.lnk" "%where_gitbash%" -wd "." -ra

regedit /s "res\git\Set_Shift+Git_Shell&Gui_Here.reg"
