choco install -y everything
CALL set-out __to_move__ es everything *.lnk -path "%where_desktop%" && CALL MOVE "%__to_move__%" "%where_shortcuts%\"
CALL set-where where_everything everything.exe
CALL shortcut-create "%where_shortcuts%\fnd.lnk" "%where_everything%"
CALL shortcut-create "%where_shortcuts%\fnda.lnk" "%where_everything%" -ra
