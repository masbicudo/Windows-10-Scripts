@echo off

if /I not "%~1"=="" (
    echo.Call "choco.exe" instead
    goto :eof
)

echo.apps\choco.cmd
call require apps\posh.cmd

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: TODO: call special version of `refreshenv`, that merges variable values
:: instead of just replacing them. It should detect whether variables contains
:: lists or not, based on name, e.g. PATH, and usage, if current variable
:: contains ';' or the registry variable contains ';', and also via parameters:
::  --list:listvar --exclude:var1
::  listvar is a list
::  var1 should not be updated from registry

set where_choco_cache=c:\choco_cache
mkdir %where_choco_cache%
choco config set cacheLocation %where_choco_cache%
