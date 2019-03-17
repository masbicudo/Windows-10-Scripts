:: HEADER
@ECHO OFF
SETLOCAL
CALL :Sub_Main %*
ENDLOCAL & IF NOT "%__VAR_VALUE%"=="" SET %__VAR_NAME%=%__VAR_VALUE%
GOTO :dieerrlvl

:: TODO: temporary internet files
:: TODO: visual studio install
:: TODO: .net folder

:: Main
GOTO :End_Main
:Sub_Main
  :: basic debugging params
  SET __TEMP=%*
  SET __TEMP=%__TEMP:"=%
  IF "%__TEMP:--debug-lines=%"=="%__TEMP%" (SET DL=REM) ELSE (
    SET __DL=1
    IF "%__TEMP:--colors=%"=="%__TEMP%" (SET DL=ECHO.DEBUG:) ELSE (SET DL=ECHO.[90mDEBUG:[0m)
  )
  %DL% Sub_Main
  SET "__VAR_NAME=%~1"
  IF "%~2"=="" SET __NO_SPEC_DIR=1
  IF "%~2"=="" (SET "__SPEC_DIR=%~1") ELSE (SET "__SPEC_DIR=%~2")
  SET "_=%__SPEC_DIR%"
  SET "_=%_:_=%"
  SET "_=%_: =%"
  SET "_=%_:.=%"
  SET "_=%_:+=%"
  SET "_=%_:-=%"
  SET "_=%_:{=%"
  SET "_=%_:}=%"
  SET "_=%_:(=%"
  SET "_=%_:)=%"
  SET "__SPEC_DIR_CL=%_%"
  SET "_=%__SPEC_DIR%"
  SET "_=%_:(=^(%"
  SET "_=%_:)=^)%"
  SET "__SPEC_DIR=%_%"
  SET "_=%__VAR_NAME%"
  IF NOT DEFINED __NO_SPEC_DIR GOTO :End_If
    SET "_=%_: =%"
  :End_If
  SET "__VAR_NAME=%_%"
  %DL% %ShFolder%
  CALL :Sub_HKCU_UserShellFolders && GOTO :End_Main
  CALL :Sub_HKLM_UserShellFolders && GOTO :End_Main
  CALL :Sub_HKCU_ShellFolders && GOTO :End_Main
  CALL :Sub_HKLM_ShellFolders && GOTO :End_Main
  CALL :Sub_Posh && GOTO :End_Main
  IF /I "%__SPEC_DIR_CL%"=="public" ( SET "__VAR_VALUE=%PUBLIC%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="user" ( SET "__VAR_VALUE=%USERPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="userprofile" ( SET "__VAR_VALUE=%USERPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="profile" ( SET "__VAR_VALUE=%USERPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="windir" ( SET "__VAR_VALUE=%windir%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="win" ( SET "__VAR_VALUE=%windir%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="system" ( SET "__VAR_VALUE=%SystemRoot%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="sys" ( SET "__VAR_VALUE=%SystemRoot%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="systemdrive" ( SET "__VAR_VALUE=%SystemDrive%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="sysdrive" ( SET "__VAR_VALUE=%SystemDrive%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="tmp" ( SET "__VAR_VALUE=%TEMP%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="temp" ( SET "__VAR_VALUE=%TEMP%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="temporaryfiles" ( SET "__VAR_VALUE=%TEMP%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramW6432" ( SET "__VAR_VALUE=%ProgramW6432%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramData" ( SET "__VAR_VALUE=%ProgramData%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramFiles" ( SET "__VAR_VALUE=%ProgramFiles%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramFilesx86" ( SET "__VAR_VALUE=%ProgramFiles(x86)%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="OneDrive" ( SET "__VAR_VALUE=%OneDrive%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="OneDriveConsumer" ( SET "__VAR_VALUE=%OneDriveConsumer%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="LOCALAPPDATA" ( SET "__VAR_VALUE=%LOCALAPPDATA%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="DriverData" ( SET "__VAR_VALUE=%DriverData%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonProgramW6432" ( SET "__VAR_VALUE=%CommonProgramW6432%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramData" ( SET "__VAR_VALUE=%ProgramData%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonProgramFilesx86" ( SET "__VAR_VALUE=%CommonProgramFiles(x86)%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ChocolateyInstall" ( SET "__VAR_VALUE=%ChocolateyInstall%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="Chocolatey" ( SET "__VAR_VALUE=%ChocolateyInstall%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="APPDATA" ( SET "__VAR_VALUE=%APPDATA%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ALLUSERSPROFILE" ( SET "__VAR_VALUE=%ALLUSERSPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ALLUSERS" ( SET "__VAR_VALUE=%ALLUSERSPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="wintmp" ( SET "__VAR_VALUE=%windir%\Temp"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="wintemp" ( SET "__VAR_VALUE=%windir%\Temp"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="windowstemporaryfiles" ( SET "__VAR_VALUE=%windir%\Temp"
  )
  IF NOT "__VAR_VALUE"=="" (
    ECHO.%__VAR_NAME%=%__VAR_VALUE%
    %DL% exit 0
    %comspec% /c exit 0 & GOTO :End_Main
  )
  CALL :Sub_NotFound
  %DL% exit 1
  %comspec% /c exit 1
:End_Main

:: HELP
GOTO :END_HELP
:SUB_HELP
ECHO.%B%%0 script v0.1.2 by MASBicudo%N%
ECHO.
ECHO.This is a tool to locate special folders by name and assign it's location to a variable.
ECHO.It will use multiple tools to accomplish it's job.
ECHO.First approach will be with the `reg` command, to look inside the many registry keys where special folders can live.
ECHO.Then, it uses powershell to call the .Net method Environment.GetFolderPath by passing a value of type Environment.SpecialFolder.
ECHO.And finally, it falls back to using environment variables.
ECHO.
ECHO.%R%Command line:%N%
ECHO.%W%%0 %C%varname%W% [%C%object%W%] [%C%parts%W%] [%C%options%W%]%N%
ECHO.%C%varname%W%: name of the variable to receive the location of the desired object.
ECHO.%C%object%W%:  special folder name
ECHO.         If ommited it will be the same as the variable name.
ECHO.         Some of the supported names:
ECHO.           %R%Desktop%N%
ECHO.%C%parts%W%:   %Y%[d][p][n][x]%N%
ECHO.         %Y%d%N% - drive letter followed by double collons ":", e.g.: %_y%C:%N%
ECHO.         %Y%p%N% - path of file, starting but not ending with backslash "\", e.g.: %_y%\DirA\DirB%N%
ECHO.             unless %Y%n%N% or %Y%x%N% are specified, in which case a backslash is used as connector.
ECHO.             e.g.: %Y%pnx%N% will give %_y%\DirA\DirB\file.exe%N%
ECHO.         %Y%n%N% - file name without extension, e.g.: %_y%file%N%
ECHO.         %Y%x%N% - extension of the file, preceeded by a dot ".", e.g.: %_y%.exe%N%
ECHO.         Multiple can be specified, e.g.: %Y%dp%N%, %Y%nx%N%
ECHO.         Leave it empty to use the default that is the fully qualified name: %Y%dpnx%N%, e.g. %_y%C:\DirA\DirB\file.exe%N%
ECHO.%C%options%W%:
ECHO.         %C%--filter%N% %Y%str%N%: any string to filter the result, useful to select among many possible resulting locations.
ECHO.         %C%--verbose%N% %Y%[0 ^| 1 ^| 2 ^| 3]%N%:
ECHO.             %Y%0%N% - no output
ECHO.             %Y%1%N% - result output
ECHO.             %Y%2%N% - debug output
ECHO.             %Y%3%N% - params output
ECHO.             Each verbose level also prints the previous levels outputs.
ECHO.         %C%--colors%N%: output with colors
ECHO.         %C%--clear%N%: allow to undefine variable, if nothing is found.
ECHO.         %C%--keep%N%: does not allow to redefine the variable, if it is already defined.
ECHO.         %C%--test%N%: does not set variables, only displays output and returns ERRORLEVEL.
ECHO.         %C%--unit-tests%N%: runs unit tests.
ECHO.         %C%--expand%N%: expand environment variables that happen to be in found pathes.
ECHO.                    This happens when the path comes from the registry, e.g.:
ECHO.                    %_y%%%ProgramFiles%%\Windows NT\Accessories\WORDPAD.EXE%N%
ECHO.         %C%--debug-lines%N%: debug important lines
ECHO.
ECHO.%R%ERRORLEVEL:%N%
ECHO.The ERRORLEVEL is set depending on the object being found or not.
ECHO.If object is not found, it is set to something other than 0 (fail).
ECHO.Otherwise, ERRORLEVEL is set to 0 (ok).
ECHO.
ECHO.%R%Examples:%N%
ECHO.%N%set-where where_cmd cmd%N%
ECHO.  %W%where_cmd%K%=%Y%C:\Windows\System32\cmd.exe%N%
ECHO.%N%set-where where_wordpad wordpad%N%
ECHO.  %W%where_wordpad%K%=%Y%%%ProgramFiles%%\Windows NT\Accessories\WORDPAD.EXE%N%
ECHO.%N%set-where where_wordpad wordpad.exe%N%
ECHO.  %W%where_wordpad%K%=%Y%%%ProgramFiles%%\Windows NT\Accessories\WORDPAD.EXE%N%
ECHO.%N%set-where where_masbicudo "AppData" dp --filter masbicudo%N%
ECHO.  %W%where_masbicudo%K%=%Y%C:\Users\masbicudo\%N%
ECHO.%N%set-where where_vscode "code" --filter microsoft%N%
ECHO.  %W%where_vscode%K%=%Y%C:\Program Files\Microsoft VS Code\Code.exe%N%
ECHO.%N%set-where where_vscode "Microsoft VS Code\Code.exe"%N%
ECHO.  %W%where_vscode%K%=%Y%C:\Program Files\Microsoft VS Code\Code.exe%N%
GOTO :EOF
:END_HELP

:: HKCU_ShellFolders
GOTO :End_HKCU_ShellFolders
:Sub_HKCU_ShellFolders
  %DL% Sub_HKCU_ShellFolders
  IF /I "%__SPEC_DIR_CL%"=="00BCFC5AED944E4896A13F6217F21990" ( SET "ShFolder={00BCFC5A-ED94-4E48-96A1-3F6217F21990}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="1B3EA5DCB5874786B4EFBD1DC332AEAE" ( SET "ShFolder={1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="374DE290123F4565916439C4925E467B" ( SET "ShFolder={374DE290-123F-4565-9164-39C4925E467B}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="4C5C32FFBB9D43B0B5B42D72E54EAAA4" ( SET "ShFolder={4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="56784854C6CB462B816988E350ACB882" ( SET "ShFolder={56784854-C6CB-462B-8169-88E350ACB882}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="7D1D3A04DEBB411595CF2F29DA2920DA" ( SET "ShFolder={7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="A520A1A417804FF6BD18167343C5AF16" ( SET "ShFolder={A520A1A4-1780-4FF6-BD18-167343C5AF16}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="BFB9D5E0C6A9404CB2B2AE6DB6AF4968" ( SET "ShFolder={BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="RoamingTiles" ( SET "ShFolder={00BCFC5A-ED94-4E48-96A1-3F6217F21990}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="Libraries" ( SET "ShFolder={1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="Downloads" ( SET "ShFolder={374DE290-123F-4565-9164-39C4925E467B}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="SavedGames" ( SET "ShFolder={4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="Contacts" ( SET "ShFolder={56784854-C6CB-462B-8169-88E350ACB882}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="Searches" ( SET "ShFolder={7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="LocalLow" ( SET "ShFolder={A520A1A4-1780-4FF6-BD18-167343C5AF16}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="Links" ( SET "ShFolder={BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="AdministrativeTools" ( SET "ShFolder=Administrative Tools"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CDBurning" ( SET "ShFolder=CD Burning"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="LocalAppData" ( SET "ShFolder=Local AppData"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="MyMusic" ( SET "ShFolder=My Music"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="music" ( SET "ShFolder=My Music"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="MyPictures" ( SET "ShFolder=My Pictures"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="pictures" ( SET "ShFolder=My Pictures"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="MyVideo" ( SET "ShFolder=My Video"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="videos" ( SET "ShFolder=My Video"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="video" ( SET "ShFolder=My Video"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="StartMenu" ( SET "ShFolder=Start Menu"
  ) ELSE ( SET "ShFolder=%__SPEC_DIR%"
  )
  SET "TEMP_Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
  :: testing if `reg` can find the registry key
  reg query "%TEMP_Key%" /v "%ShFolder%" 2>NUL | findstr /c:"%ShFolder%" 2>NUL 1>NUL || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_HKCU_ShellFolders )
  FOR /f "usebackq tokens=*" %%a IN (` reg query "%TEMP_Key%" /v "%ShFolder%" 2^>NUL ^| findstr /c:"%ShFolder%" 2^>NUL `) DO SET __VAR_VALUE=%%a
  CALL :Sub_RegFound
  %DL% exit 0
  %comspec% /c exit 0
:End_HKCU_ShellFolders

:: HKLM_ShellFolders
GOTO :End_HKLM_ShellFolders
:Sub_HKLM_ShellFolders
  %DL% Sub_HKLM_ShellFolders
  IF /I "%__SPEC_DIR_CL%"=="CommonAdministrativeTools" ( SET "ShFolder=Common Administrative Tools"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicAdministrativeTools" ( SET "ShFolder=Common Administrative Tools"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonAppData" ( SET "ShFolder=Common AppData"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicAppData" ( SET "ShFolder=Common AppData"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonDesktop" ( SET "ShFolder=Common Desktop"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicDesktop" ( SET "ShFolder=Common Desktop"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonDocuments" ( SET "ShFolder=Common Documents"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicDocuments" ( SET "ShFolder=Common Documents"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonPrograms" ( SET "ShFolder=Common Programs"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicPrograms" ( SET "ShFolder=Common Programs"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonStartMenu" ( SET "ShFolder=Common Start Menu"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicStart_Menu" ( SET "ShFolder=Common Start Menu"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonStartup" ( SET "ShFolder=Common Startup"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicStartup" ( SET "ShFolder=Common Startup"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonTemplates" ( SET "ShFolder=Common Templates"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicTemplates" ( SET "ShFolder=Common Templates"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="OEMLinks" ( SET "ShFolder=OEM Links"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicLinks" ( SET "ShFolder=OEM Links"
  ) ELSE ( SET "ShFolder=%__SPEC_DIR%"
  )
  SET "TEMP_Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
  :: testing if `reg` can find the registry key
  reg query "%TEMP_Key%" /v "%ShFolder%" 2>NUL | findstr /c:"%ShFolder%" 2>NUL 1>NUL || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_HKLM_ShellFolders )
  FOR /f "usebackq tokens=*" %%a IN (` reg query "%TEMP_Key%" /v "%ShFolder%" 2^>NUL ^| findstr /c:"%ShFolder%" 2^>NUL `) DO SET __VAR_VALUE=%%a
  CALL :Sub_RegFound
  %DL% exit 0
  %comspec% /c exit 0
:End_HKLM_ShellFolders

:: HKLM_UserShellFolders
GOTO :End_HKLM_UserShellFolders
:Sub_HKLM_UserShellFolders
  %DL% Sub_HKLM_UserShellFolders
  IF /I "%__SPEC_DIR_CL%"=="3D644C9B1FB84f309B45F670235F79C0" ( SET "ShFolder={3D644C9B-1FB8-4f30-9B45-F670235F79C0}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="commondownloads" ( SET "ShFolder={3D644C9B-1FB8-4f30-9B45-F670235F79C0}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="publicdownloads" ( SET "ShFolder={3D644C9B-1FB8-4f30-9B45-F670235F79C0}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonAppData" ( SET "ShFolder=Common AppData"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicAppData" ( SET "ShFolder=Common AppData"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonDesktop" ( SET "ShFolder=Common Desktop"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicDesktop" ( SET "ShFolder=Common Desktop"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonDocuments" ( SET "ShFolder=Common Documents"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicDocuments" ( SET "ShFolder=Common Documents"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonPrograms" ( SET "ShFolder=Common Programs"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicPrograms" ( SET "ShFolder=Common Programs"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonStartMenu" ( SET "ShFolder=Common Start Menu"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicStart_Menu" ( SET "ShFolder=Common Start Menu"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonStartup" ( SET "ShFolder=Common Startup"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicStartup" ( SET "ShFolder=Common Startup"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonTemplates" ( SET "ShFolder=Common Templates"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="PublicTemplates" ( SET "ShFolder=Common Templates"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="publicmusic" ( SET "ShFolder=CommonMusic"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="publicpictures" ( SET "ShFolder=CommonPictures"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="publicvideos" ( SET "ShFolder=CommonVideo"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="publicvideo" ( SET "ShFolder=CommonVideo"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="commonmusic" ( SET "ShFolder=CommonMusic"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="commonpictures" ( SET "ShFolder=CommonPictures"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="commonvideos" ( SET "ShFolder=CommonVideo"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="commonvideo" ( SET "ShFolder=CommonVideo"
  ) ELSE ( SET "ShFolder=%__SPEC_DIR%"
  )
  SET "TEMP_Key=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
  :: testing if `reg` can find the registry key
  reg query "%TEMP_Key%" /v "%ShFolder%" 2>NUL | findstr /c:"%ShFolder%" 2>NUL 1>NUL || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_HKLM_UserShellFolders )
  FOR /f "usebackq tokens=*" %%a IN (` reg query "%TEMP_Key%" /v "%ShFolder%" 2^>NUL ^| findstr /c:"%ShFolder%" 2^>NUL `) DO SET __VAR_VALUE=%%a
  CALL :Sub_RegFound
  %DL% exit 0
  %comspec% /c exit 0
:End_HKLM_UserShellFolders

:: Set_Colors
GOTO :End_Set_Colors
:Sub_Set_Colors
  SET _k=[30m&SET _r=[31m&SET _g=[32m&SET _y=[33m&SET _b=[34m&SET _m=[35m&SET _c=[36m&SET _w=[37m&
  SET K=[90m&SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&
  SET N=[0m
:End_Set_Colors

:: HKCU_UserShellFolders
GOTO :End_HKCU_UserShellFolders
:Sub_HKCU_UserShellFolders
  %DL% Sub_HKCU_UserShellFolders
  %DL% __SPEC_DIR_CL=%__SPEC_DIR_CL%
  IF /I "%__SPEC_DIR_CL%"=="Downloads" ( SET "ShFolder={374DE290-123F-4565-9164-39C4925E467B}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="onedrivemusic" ( SET "ShFolder={C3F2459E-80D6-45DC-BFEF-1F769F2BE730}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="onedrivedcim" ( SET "ShFolder={767E6811-49CB-4273-87C2-20F355E1085B}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="374DE290123F4565916439C4925E467B" ( SET "ShFolder={374DE290-123F-4565-9164-39C4925E467B}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="C3F2459E80D645DCBFEF1F769F2BE730" ( SET "ShFolder={C3F2459E-80D6-45DC-BFEF-1F769F2BE730}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="767E681149CB427387C220F355E1085B" ( SET "ShFolder={767E6811-49CB-4273-87C2-20F355E1085B}"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="music" ( SET "ShFolder=My Music"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="pictures" ( SET "ShFolder=My Pictures"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="videos" ( SET "ShFolder=My Video"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="video" ( SET "ShFolder=My Video"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="StartMenu" ( SET "ShFolder=Start Menu"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="LocalAppData" ( SET "ShFolder=Local AppData"
  ) ELSE ( SET "ShFolder=%__SPEC_DIR%"
  )
  SET "TEMP_Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
  :: testing if `reg` can find the registry key
  reg query "%TEMP_Key%" /v "%ShFolder%" 2>NUL | findstr /c:"%ShFolder%" 2>NUL 1>NUL || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_HKCU_UserShellFolders )
  FOR /f "usebackq tokens=*" %%a IN (` reg query "%TEMP_Key%" /v "%ShFolder%" 2^>NUL ^| findstr /c:"%ShFolder%" 2^>NUL `) DO SET __VAR_VALUE=%%a
  CALL :Sub_RegFound
  %DL% exit 0
  %comspec% /c exit 0
:End_HKCU_UserShellFolders

:: RegFound
GOTO :End_RegFound
:Sub_RegFound
  %DL% Sub_RegFound
  FOR %%a IN ("%ShFolder%") DO SET "__temp=%%~a"
  %DL% %__temp%
  %DL% %__VAR_VALUE%
  CALL SET __VAR_VALUE=%%__VAR_VALUE:%__temp%    REG_EXPAND_SZ    =%%
  CALL SET __VAR_VALUE=%%__VAR_VALUE:%__temp%    REG_SZ    =%%
  SET __VAR_VALUE=%__VAR_VALUE%##XP_TO_7123##
  SET __VAR_VALUE=%__VAR_VALUE: ##XP_TO_7123##=##XP_TO_7123##%
  SET __VAR_VALUE=%__VAR_VALUE:##XP_TO_7123##=%
  ECHO.%__VAR_NAME%=%__VAR_VALUE%
:End_RegFound

:: Posh
GOTO :End_Posh
:Sub_Posh
  %DL% Sub_Posh
  where powershell 1>nul 2>&1 || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_Posh
    )
  SET ENV=Environment
  SET ENUM=%ENV%+SpecialFolder
  for /F "usebackq tokens=1 delims=" %%a in (
    `powershell [%ENUM%]$x^=0^;switch([%ENUM%]::TryParse('%__SPEC_DIR%'^,$true^,[ref]$x^)^){$true{[%ENV%]::GetFolderPath($x^)}$false{''}}`
  ) do SET __VAR_VALUE=%%~a
  IF "%__VAR_VALUE%"=="" (
    for /F "usebackq tokens=1 delims=" %%a in (
      `powershell [%ENUM%]$x^=0^;switch([%ENUM%]::TryParse('%__SPEC_DIR_CL%'^,$true^,[ref]$x^)^){$true{[%ENV%]::GetFolderPath($x^)}$false{''}}`
    ) do SET __VAR_VALUE=%%~a
  )
  IF "%__VAR_VALUE%"=="" ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_Posh )
  ECHO.%__VAR_NAME%=%__VAR_VALUE%
  %DL% exit 0
  %comspec% /c exit 0
:End_Posh

:: NotFound
GOTO :End_NotFound
:Sub_NotFound
  %DL% Sub_NotFound
  ECHO.Special folder not found 1>&2
  :: calling `reg` again to set errorlevel
  reg query "%TEMP_Key%" /v %ShFolder% 2>NUL | findstr /c:%ShFolder% 2>NUL 1>NUL
:End_NotFound

:: FOOTER
GOTO :EOF
:dieerrlvl
%comspec% /c exit %errorlevel%