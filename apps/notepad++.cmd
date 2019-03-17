call require app/choco.cmd
choco install -y notepadplusplus
call set-where where_npp notepad++
shortcut-create "%where_shortcuts%\npp.lnk" "%where_npp%"
shortcut-create "%where_shortcuts%\nppa.lnk" "%where_npp%" -ra
:: TODO: set font to open monospace
:: TODO: set vertical line at char 80
:: TODO: set tabulation with 2 spaces
:: TODO: encrypt autosave folder
:: TODO: vertical list of files
call set-where where_npp_settings "Notepad++\config.xml" dp --filter "masbicudo"
xml "%APPDATA%\Notepad++\config.xml" NotepadPlus/GUIConfigs/GUIConfig/
:: TODO: replace file with pre-built one???
:: set extensions to open with notepad++
