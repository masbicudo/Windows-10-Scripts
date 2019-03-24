call require apps\posh.cmd

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

set where_choco_cache=c:\choco_cache
mkdir %where_choco_cache%
choco config set cacheLocation %where_choco_cache%
