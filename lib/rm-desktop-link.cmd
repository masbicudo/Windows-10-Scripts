@echo off
call require places.cmd

:: TODO: set-out requires the compilation of `eat.c`?
::       it seems to be working well with `eat.cmd`

setlocal

:: Shortcut extensions
:: LNK (File/Folder Shortcut)
:: URL (Internet Shortcut)
:: PIF (MS-DOS Program Shortcut)
:: SCF (Windows Explorer Command)
:: SHS (Shell Scrap Object)
:: SHB (Document Shortcut)
:: XNK (Exchange Folder Shortcut)

:: move .lnk files from user and public desktop to shortcuts folder
call set-out __to_move__ es %* *.lnk -parent "%where_desktop%"
if defined __to_move__ call MOVE "%__to_move__%" "%where_shortcuts%\"
call set-out __to_move__ es %* *.lnk -parent "%where_public_desktop%"
if defined __to_move__ call MOVE "%__to_move__%" "%where_shortcuts%\"

:: move .url files from user and public desktop to shortcuts folder
call set-out __to_move__ es %* *.url -parent "%where_desktop%"
if defined __to_move__ call MOVE "%__to_move__%" "%where_shortcuts%\"
call set-out __to_move__ es %* *.url -parent "%where_public_desktop%"
if defined __to_move__ call MOVE "%__to_move__%" "%where_shortcuts%\"
