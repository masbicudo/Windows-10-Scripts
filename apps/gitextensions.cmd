choco install -y gitextensions
CALL set-where where_gitex gitex.exe
CALL set-where where_gitextensions GitExtensions.exe
CALL shortcut-create "%where_shortcuts%\gitex.lnk" "%where_gitex%" -i "%where_gitextensions%,0"
CALL MOVE "%where_public_desktop%\Git Extensions.lnk" "%where_shortcuts%\"
