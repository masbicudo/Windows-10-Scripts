call require apps\choco.cmd
choco install -y git --params "/GitAndUnixToolsOnPath"

call set-where where_git git
call set-where where_gitbash bash --filter git

call shortcut-create.cmd "%where_shortcuts%\gitbash.lnk" "%where_gitbash%"
call shortcut-create.cmd "%where_shortcuts%\gitbasha.lnk" "%where_gitbash%" -ra
