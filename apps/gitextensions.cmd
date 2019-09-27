call require apps\choco.cmd

choco upgrade -y gitextensions

call set-where where_gitex gitex.exe
call set-where where_gitextensions GitExtensions.exe

shortcut-create "%where_shortcuts%\gitex.lnk" "%where_gitex%" -i "%where_gitextensions%,0"
call MOVE "%where_public_desktop%\Git Extensions.lnk" "%where_shortcuts%\"
call rm-desktop-link "Git Extensions.lnk"
