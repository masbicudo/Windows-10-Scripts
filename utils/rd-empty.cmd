:: https://superuser.com/questions/39674/recursively-delete-empty-directories-in-windows
@ECHO OFF
for /f "delims=" %%d in ('dir /s /b /ad %* ^| sort /r') do rd "%%d"