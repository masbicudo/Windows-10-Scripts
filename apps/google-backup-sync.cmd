call require apps\choco.cmd
call require places.cmd

choco upgrade -y google-backup-and-sync --ignore-checksums

:: initialize user settings - reference: https://support.google.com/a/answer/2490101?hl=en
mkdir "%UserProfile%\AppData\Local\Google\Drive\user_default"
copy "%~dp0\..\res\google_backup_sync\*" "%UserProfile%\AppData\Local\Google\Drive\user_default\" /Y

call rm-desktop-link "Google Sheets.lnk"
call rm-desktop-link "Google Docs.lnk"
call rm-desktop-link "Google Slides.lnk"

call set-where where_google_backup_sync "googledrivesync.exe"
shortcut-create "%where_shortcuts%\gbs.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\google-backup-sync.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\google_backup_sync.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\google_drive.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\drive.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\gdrive.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\gd.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\gdrv.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\gbackup.lnk" "%where_google_backup_sync%"
shortcut-create "%where_shortcuts%\gbkp.lnk" "%where_google_backup_sync%"
