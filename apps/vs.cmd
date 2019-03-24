call require apps\choco.cmd
choco install -y visualstudio2017community

call set-where where_vs devenv.exe
shortcut-create "%where_shortcuts%\vs.lnk" "%where_vs%"
shortcut-create "%where_shortcuts%\vsa.lnk" "%where_vs%" -ra
