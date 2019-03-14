@ECHO OFF
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /v Favorites /t REG_BINARY /d FF /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /v FavoritesResolve /t REG_BINARY /d FF /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /v FavoritesChanges /t REG_DWORD /d 0 /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /v FavoritesVersion /t REG_DWORD /d 1 /f
