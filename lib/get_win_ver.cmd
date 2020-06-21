@echo off

FOR /F "tokens=2* skip=2" %%a in (
    'reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -v ProductName'
  ) do set ProductName=%%b

FOR /F "tokens=2* skip=2" %%a in (
    'reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -v CurrentMajorVersionNumber'
  ) do set /a Major=%%b

FOR /F "tokens=2* skip=2" %%a in (
    'reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -v CurrentMinorVersionNumber'
  ) do set /a Minor=%%b

FOR /F "tokens=2* skip=2" %%a in (
    'reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -v CurrentBuild'
  ) do set CurrentBuild=%%b

FOR /F "tokens=2* skip=2" %%a in (
    'reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -v ReleaseId'
  ) do set ReleaseId=%%b

FOR /F "tokens=2* skip=2" %%a in (
    'reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -v UBR'
  ) do set /a UBR=%%b

echo.%ProductName% %ReleaseId% %Major%.%Minor%.%CurrentBuild%.%UBR%
