:: HEADER
@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET script_name=%~nx0
CALL :SUB_DEBUG_LINES %*
CALL :Sub_Main %*
%DL% __VAR__=%__VAR__%
%DL% %__VAR__%=!%__VAR__%!
%DL% SET __RETURN_VALUE__=!%__VAR__%!
SET __RETURN_VALUE__=!%__VAR__%!
%DL% ENDLOCAL ^& CALL SET %__VAR__%=%__RETURN_VALUE__%
ENDLOCAL & CALL SET "%__VAR__%=%__RETURN_VALUE__%"
GOTO :dieerrlvl

:: HELP
GOTO :END_HELP
:SUB_HELP
  ECHO.%B%%script_name% script v0.2.1 by MASBicudo%N%
  ECHO.
  ECHO.This is a tool to locate special folders by name and assign it's location to a variable.
  ECHO.It will use multiple tools to accomplish it's job.
  ECHO.First approach will be with the `reg` command, to look inside the many registry keys where special folders can live.
  ECHO.Then, it uses powershell to call the .Net method Environment.GetFolderPath by passing a value of type Environment.SpecialFolder.
  ECHO.And finally, it falls back to using environment variables.
  ECHO.
  ECHO.%R%Command line:%N%
  ECHO.%W%%script_name% %C%varname%W% [%C%object%W%] [%C%parts%W%] [%C%options%W%]%N%
  ECHO.%C%varname%W%: name of the variable to receive the location of the desired object.
  ECHO.%C%object%W%:  %Y%special folder name%N%
  ECHO.         If ommited it will be the same as the variable name.
  ECHO.         Some of the supported names:
  ECHO.           %R%Desktop%N%
  ECHO.%C%parts%W%:   %W%[%Y%d%W%][%Y%p%W%][%Y%n%W%][%Y%x%W%]%N%
  ECHO.         %Y%d%N% - drive letter followed by double collons ":", e.g.: %_y%C:%N%
  ECHO.         %Y%p%N% - path of file, starting but not ending with backslash "\", e.g.: %_y%\DirA\DirB%N%
  ECHO.             unless %Y%n%N% or %Y%x%N% are specified, in which case a backslash is used as connector.
  ECHO.             e.g.: %Y%pnx%N% will give %_y%\DirA\DirB\file.exe%N%
  ECHO.         %Y%n%N% - file name without extension, e.g.: %_y%file%N%
  ECHO.         %Y%x%N% - extension of the file, preceeded by a dot ".", e.g.: %_y%.exe%N%
  ECHO.         Multiple can be specified, e.g.: %Y%dp%N%, %Y%nx%N%
  ECHO.         When these flags are defined, variables in the path will get expanded:
  ECHO.             %Y%%%%_y%USERPROFILE%Y%%%%_y%\AppData\Roaming%N% --^> %_y%%USERPROFILE%\AppData\Roaming%N%
  ECHO.         Leave it empty to use the value as specified by the source.
  ECHO.         Can be defined through environment variable %B%__DPNX__%N%.
  ECHO.%C%options%W%:
  ECHO.         %C%--filter%N% %Y%str%N%: %R%(not implemented)%N% any string to filter the result, useful to select among many possible resulting locations.
  ECHO.             Env var %B%__FILTER__%N% %R%(not implemented)%N% can be used to specify the filter.
  ECHO.         %C%--verbose%N% %W%[ %Y%0 %W%^|%Y% 1 %W%^|%Y% 2 %W%^|%Y% 3%W% ]%N%:
  ECHO.             %Y%0%N% - no output (default when %B%__VERBOSE__%N% is %Y%F%N%)
  ECHO.             %Y%1%N% - result output (default if %C%--verbose%N% is not present nor %B%__VERBOSE__%N%)
  ECHO.             %Y%2%N% - debug output (default when using %C%--verbose%N% alone, or %B%__VERBOSE__%N% is %Y%T%N%)
  ECHO.             %Y%3%N% - params output
  ECHO.             Each verbose level also prints the previous levels outputs.
  ECHO.             Env var %B%__VERBOSE__%N% can be used to specify the verbosity level, in addition to %W%[%Y% T %W%^|%Y% F %W%]%N%
  ECHO.         %C%--colors%N%: output with colors; Env var: %B%__COLORS__%N% = %W%[%Y% T %W%^|%Y% F %W%]%Y%%N%
  ECHO.         %C%--no-colors%N%: output without colors, used to override env var %B%__COLORS__%N%
  ECHO.         %C%--clear%N%: allow to undefine variable, if nothing is found; Env var: %B%__CLEAR__%N% = %W%[%Y% T %W%^|%Y% F %W%]%Y%%N%
  ECHO.         %C%--keep%N%: does not allow to redefine the variable, if it is already defined; Env var: %B%__KEEP__%N% = %W%[%Y% T %W%^|%Y% F %W%]%Y%%N%
  ECHO.         %C%--test%N%: %R%(not implemented)%N% does not set variables, only displays output and returns ERRORLEVEL.
  ECHO.             Env var with oposite meaning: %R%(not implemented)%N% %B%__SET__%N% = %W%[%Y% T %W%^|%Y% F %W%]%Y%%N%
  ECHO.         %C%--unit-tests%N%: %R%(not implemented)%N% runs unit tests; Env var: %B%__UNIT_TESTS__%N% = %W%[%Y% T %W%^|%Y% F %W%]%Y%%N%
  ECHO.         %C%--debug-lines%N%: debug important lines
  ECHO.
  ECHO.%R%ERRORLEVEL:%N%
  ECHO.The ERRORLEVEL is set depending on the object being found or not.
  ECHO.If object is not found, it is set to something other than 0 (fail).
  ECHO.Otherwise, ERRORLEVEL is set to 0 (ok).
  ECHO.
  ECHO.%R%Examples:%N%
  ECHO.%N%%script_name% where_appdata appdata%N%
  ECHO.  %W%where_appdata%K%=%Y%%%USERPROFILE%%\AppData\Roaming%N%
  ECHO.%N%%script_name% where_appdata appdata dpnx%N%
  ECHO.  %W%where_appdata%K%=%Y%%USERPROFILE%\AppData\Roaming%N%
  ECHO.%N%%script_name% where_desktop desktop%N%
  ECHO.  %W%where_desktop%K%=%Y%%USERPROFILE%\Desktop%N%
GOTO :EOF
:END_HELP

:: TESTS
GOTO :END_TESTS
:SUB_TESTS
SETLOCAL
  ECHO.No tests implemented!
ENDLOCAL
GOTO :EOF
:END_TESTS

:: TODO: temporary internet files
:: TODO: visual studio install
:: TODO: .net folder

::
:: DEBUG_LINES
::
::  Initialize variables to debug lines using the DL variable
GOTO :END_DEBUG_LINES
:SUB_DEBUG_LINES
  :: basic debugging params
  SET __TEMP=%*
  SET __TEMP=%__TEMP:"=%
  IF NOT "%__TEMP:--debug-lines=%"=="%__TEMP%" SET "__DEBUG_LINES__=T"
  IF NOT "%__DEBUG_LINES__%"=="T" (
    SET DL=REM
  ) ELSE (
    SET __DL=1
    IF "%__TEMP:--colors=%"=="%__TEMP%" (SET DL=ECHO.DEBUG:) ELSE (SET DL=ECHO.[90mDEBUG:[0m)
  )
GOTO :EOF
:END_DEBUG_LINES

::
:: Main
::
::  Main script procedure
GOTO :End_Main
:Sub_Main
SETLOCAL
  %DL% Sub_Main

  :: Clearing color variables
  FOR %%C IN (_k;_r;_g;_y;_b;_m;_c;_w;K;R;G;Y;B;M;C;W;N) DO SET %%C=

  :: Initializing parameter variables
  SET _num_vars=__VERBOSE__;__ORD__
  SET _bool_vars=__CLEAR__;__KEEP__;__HELP__;__SET__;__UNIT_TESTS__;__COLORS__
  SET _str_vars=__VAR__;__SEARCH__;__EXT__;__DPNX__;__FILTER__
  SET _char_vars=__d;__p;__n;__x

  FOR %%C IN (__ORD__;__VAR__;%_char_vars%) DO SET %%C=

  SET _verb_n=1
  SET _verb_t=2
  SET _verb_f=0

  SET __ORD__=1
  IF NOT DEFINED __VERBOSE__    SET __VERBOSE__=%_verb_n%
  IF /I "%__VERBOSE__%"=="T"    SET __VERBOSE__=%_verb_t%
  IF /I "%__VERBOSE__%"=="F"    SET __VERBOSE__=%_verb_f%
  IF NOT DEFINED __CLEAR__      SET __CLEAR__=F
  IF NOT DEFINED __KEEP__       SET __KEEP__=F
  IF NOT DEFINED __HELP__       SET __HELP__=F
  IF NOT DEFINED __SET__        SET __SET__=T
  IF NOT DEFINED __UNIT_TESTS__ SET __UNIT_TESTS__=F
  IF NOT DEFINED __COLORS__     SET __COLORS__=F
  SET __NO_SPEC_DIR=1

  :: Parsing parameters
  :BEGIN_LOOP_PARAMS
  %DL% IF "%~1"=="" IF [%1]==[] GOTO :END_LOOP_PARAMS
  IF "%~1"=="" IF [%1]==[] GOTO :END_LOOP_PARAMS
  %DL% SET __ARG__=%1
  SET __ARG__=%1
  IF "%~1"=="--verbose" (
    %DL% SET __VERBOSE__=%_verb_t%
    SET __VERBOSE__=%_verb_t%
    SHIFT
    IF "%~2"=="0" ( SET "__VERBOSE__=0" & SHIFT )
    IF "%~2"=="1" ( SET "__VERBOSE__=1" & SHIFT )
    IF "%~2"=="2" ( SET "__VERBOSE__=2" & SHIFT )
    IF "%~2"=="3" ( SET "__VERBOSE__=3" & SHIFT )
  ) ELSE IF "%~1"=="--clear"      ( SET "__CLEAR__=T"      & SHIFT
  ) ELSE IF "%~1"=="--debug-lines" (                         SHIFT
  ) ELSE IF "%~1"=="--keep"       ( SET "__KEEP__=T"       & SHIFT
  ) ELSE IF "%~1"=="--test"       ( SET "__SET__=F"        & SHIFT
  ) ELSE IF "%~1"=="--unit-tests" ( SET "__UNIT_TESTS__=T" & SHIFT
  ) ELSE IF "%~1"=="--help"       ( SET "__HELP__=T"       & SHIFT
  ) ELSE IF "%~1"=="-help"        ( SET "__HELP__=T"       & SHIFT
  ) ELSE IF "%~1"=="/?"           ( SET "__HELP__=T"       & SHIFT
  ) ELSE IF "%~1"=="--filter"     ( SET __FILTER__="%~2"&    SHIFT & SHIFT
  ) ELSE IF "%~1"=="--no-colors"  ( SET __COLORS__=F&        SHIFT
  ) ELSE IF "%~1"=="--colors"     ( SET __COLORS__=T&        SHIFT
  ) ELSE IF "%__ORD__%"=="1" (
    %DL% SET "__VAR__=%~1"
    SET "__VAR__=%~1"
    SET "__SEARCH__=%~1"
    SET "__ORD__=2"
    SHIFT
  ) ELSE IF "%__ORD__%"=="2" (
    %DL% SET "__SEARCH__=%~1"
    SET "__SEARCH__=%~1"
    SET __NO_SPEC_DIR=
    SET "__ORD__=3"
    SHIFT
  ) ELSE IF "%__ORD__%"=="3" (
    %DL% SET "__DPNX__=%~1"
    SET "__DPNX__=%~1"
    SET "__ORD__=4"
    SHIFT
  ) ELSE GOTO :END_LOOP_PARAMS
  %DL% GOTO :BEGIN_LOOP_PARAMS
  GOTO :BEGIN_LOOP_PARAMS
  :END_LOOP_PARAMS

  :: Colors
  IF /I "%__COLORS__%"=="T" call :SUB_SET_COLORS

  :: DPNX parameters (extract path components)
  %DL% SET __DPNX__=_%__DPNX__%
  SET __DPNX__=_%__DPNX__%
  IF NOT "%__DPNX__:d=%" == "%__DPNX__%" SET __d=d
  IF NOT "%__DPNX__:p=%" == "%__DPNX__%" SET __p=p
  IF NOT "%__DPNX__:n=%" == "%__DPNX__%" SET __n=n
  IF NOT "%__DPNX__:x=%" == "%__DPNX__%" SET __x=x
  FOR %%C IN (__ARG__) DO SET %%C=
  SET "__DPNX__=%__d%%__p%%__n%%__x%"

  :: Printing parameters
  %DL% Printing parameters
  SETLOCAL EnableDelayedExpansion
  IF %__VERBOSE__% GEQ 3 (
    FOR /F "tokens=1* usebackq delims==" %%a IN (` SET __ `) DO (
      SET _=%%a
      call SET __=%%_str_vars:!_!=%%
      IF NOT "!__!"=="%_str_vars%" ECHO.%W%%%a%K%=%_y%%%b%N%
      call SET __=%%_bool_vars:!_!=%%
      IF NOT "!__!"=="%_bool_vars%" ECHO.%W%%%a%K%=%_c%%%b%N%
      call SET __=%%_num_vars:!_!=%%
      IF NOT "!__!"=="%_num_vars%" ECHO.%W%%%a%K%=%M%%%b%N%
    )
    IF DEFINED __DL ECHO.%W%__DL%K%=%M%%__DL%%N%
  )
  ENDLOCAL

  :: help and unit-tests
  IF  /I "%__UNIT_TESTS__%"=="T" call :SUB_TESTS
  IF  /I "%__HELP__%"=="T" call :SUB_HELP

  :: exiting if not enough parameters
  IF %__ORD__% LEQ 1 GOTO :EOF

  :: __VAR__ must be treated before proceeding
  %DL% __VAR__ must be treated before proceeding
  SET "_=%__SEARCH__%"
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
  SET "_=%__SEARCH__%"
  SET "_=%_:(=^(%"
  SET "_=%_:)=^)%"
  SET "__SEARCH__=%_%"
  SET "_=%__VAR__%"
  IF NOT DEFINED __NO_SPEC_DIR GOTO :End_If
    SET "_=%_: =%"
  :End_If
  SET "__VAR__=%_%"

  ::
  :: Trying to find the special folder name path
  ::
  :: Each of these call represents a major way of finding these pathes.
  :: Each one of them returns indicating whether it succeded or failed.
  %DL% Trying to find the special folder name path
  %DL% ShFolder=%ShFolder%
  call :Sub_HKCU_UserShellFolders && GOTO :ShowResult
  call :Sub_HKLM_UserShellFolders && GOTO :ShowResult
  call :Sub_HKCU_ShellFolders && GOTO :ShowResult
  call :Sub_HKLM_ShellFolders && GOTO :ShowResult
  call :Sub_Posh && GOTO :ShowResult

  :: Trying some common special folder names
  %DL% Trying some common special folder names
  IF /I "%__SPEC_DIR_CL%"=="public" ( SET "__VALUE__=%PUBLIC%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="user" ( SET "__VALUE__=%USERPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="userprofile" ( SET "__VALUE__=%USERPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="profile" ( SET "__VALUE__=%USERPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="windir" ( SET "__VALUE__=%windir%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="win" ( SET "__VALUE__=%windir%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="system" ( SET "__VALUE__=%SystemRoot%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="sys" ( SET "__VALUE__=%SystemRoot%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="systemdrive" ( SET "__VALUE__=%SystemDrive%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="sysdrive" ( SET "__VALUE__=%SystemDrive%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="tmp" ( SET "__VALUE__=%TEMP%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="temp" ( SET "__VALUE__=%TEMP%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="temporaryfiles" ( SET "__VALUE__=%TEMP%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramW6432" ( SET "__VALUE__=%ProgramW6432%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramData" ( SET "__VALUE__=%ProgramData%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramFiles" ( SET "__VALUE__=%ProgramFiles%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramFilesx86" ( SET "__VALUE__=%ProgramFiles(x86)%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="OneDrive" ( SET "__VALUE__=%OneDrive%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="OneDriveConsumer" ( SET "__VALUE__=%OneDriveConsumer%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="LOCALAPPDATA" ( SET "__VALUE__=%LOCALAPPDATA%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="DriverData" ( SET "__VALUE__=%DriverData%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonProgramW6432" ( SET "__VALUE__=%CommonProgramW6432%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ProgramData" ( SET "__VALUE__=%ProgramData%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="CommonProgramFilesx86" ( SET "__VALUE__=%CommonProgramFiles(x86)%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ChocolateyInstall" ( SET "__VALUE__=%ChocolateyInstall%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="Chocolatey" ( SET "__VALUE__=%ChocolateyInstall%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="APPDATA" ( SET "__VALUE__=%APPDATA%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ALLUSERSPROFILE" ( SET "__VALUE__=%ALLUSERSPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="ALLUSERS" ( SET "__VALUE__=%ALLUSERSPROFILE%"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="wintmp" ( SET "__VALUE__=%windir%\Temp"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="wintemp" ( SET "__VALUE__=%windir%\Temp"
  ) ELSE IF /I "%__SPEC_DIR_CL%"=="windowstemporaryfiles" ( SET "__VALUE__=%windir%\Temp"
  )
  IF NOT "%__VALUE__%"=="" (
    ECHO.%__VAR__%=%__VALUE__%
    %DL% exit 0
    %comspec% /c exit 0 & GOTO :ShowResult
  )
  goto :Raise_Error

  :ShowResult
    %DL% :ShowResult
    :: DPNX flags
    %DL% IF DEFINED __DPNX__ ...
    %DL% ECHO.__VALUE__="%__VALUE__%"
    IF DEFINED __DPNX__ (
      FOR /F "tokens=* usebackq delims=" %%i IN (`ECHO."%__VALUE__%"`) DO (
        %DL% ECHO.DPNX: %Y%%%~%__DPNX__%i%N%
        call SET "__VALUE__=%%~%__DPNX__%i"
      )
    )
    %DL% IF DEFINED __p IF NOT DEFINED __n IF NOT DEFINED __x SET ...
    IF DEFINED __p IF NOT DEFINED __n IF NOT DEFINED __x SET "__VALUE__=%__VALUE__:~0,-1%"
    IF DEFINED __d IF NOT DEFINED __p (
      IF DEFINED __n ( SET "__VALUE__=%__VALUE__::=:\%"
      ) ELSE IF DEFINED __x ( SET "__VALUE__=%__VALUE__::=:\%"
      )
    )

    :: Returning value
    %DL% :: Returning value
    %DL% IF %__VERBOSE__% GEQ 1 ECHO.%W%%__VAR__%%K%=%Y%%__VALUE__%%N%
    IF %__VERBOSE__% GEQ 1 ECHO.%W%%__VAR__%%K%=%Y%%__VALUE__%%N%
    IF DEFINED %__VAR__% IF /I "%__KEEP__%"=="T" SET __SET__=F
    %DL% ENDLOCAL ^& ( IF /I "%__SET__%"=="T" SET "%__VAR__%=%__VALUE__%" ) ^& SET __VAR__=%__VAR__%
    ENDLOCAL & ( IF /I "%__SET__%"=="T" SET "%__VAR__%=%__VALUE__%" ) & SET __VAR__=%__VAR__%
    
    %DL% exit 0
    %comspec% /c exit 0

    goto :End_Main

  :Raise_Error
    %DL% :Raise_Error
    IF %__VERBOSE__% GEQ 1 ECHO.%R%Special folder not found%N% 1>&2
    ENDLOCAL & ( IF /I "%__SET__%"=="T" IF /I "%__CLEAR__%"=="T" SET "%__VAR__%=" ) & SET __VAR__=%__VAR__%
    %DL% exit 1
    %comspec% /c exit 1

:End_Main

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
  ) ELSE ( SET "ShFolder=%__SEARCH__%"
  )
  SET "TEMP_Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
  :: testing if `reg` can find the registry key
  reg query "%TEMP_Key%" /v "%ShFolder%" 2>NUL | findstr /c:"%ShFolder%" 2>NUL 1>NUL || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_HKCU_ShellFolders )
  FOR /f "usebackq tokens=*" %%a IN (` reg query "%TEMP_Key%" /v "%ShFolder%" 2^>NUL ^| findstr /c:"%ShFolder%" 2^>NUL `) DO SET __VALUE__=%%a
  call :Sub_RegFound
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
  ) ELSE ( SET "ShFolder=%__SEARCH__%"
  )
  SET "TEMP_Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
  :: testing if `reg` can find the registry key
  reg query "%TEMP_Key%" /v "%ShFolder%" 2>NUL | findstr /c:"%ShFolder%" 2>NUL 1>NUL || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_HKLM_ShellFolders )
  FOR /f "usebackq tokens=*" %%a IN (` reg query "%TEMP_Key%" /v "%ShFolder%" 2^>NUL ^| findstr /c:"%ShFolder%" 2^>NUL `) DO SET __VALUE__=%%a
  call :Sub_RegFound
  %DL% exit 0
  %comspec% /c exit 0
:End_HKLM_ShellFolders

::
:: HKLM_UserShellFolders
::
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
  ) ELSE ( SET "ShFolder=%__SEARCH__%"
  )
  SET "TEMP_Key=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
  :: testing if `reg` can find the registry key
  reg query "%TEMP_Key%" /v "%ShFolder%" 2>NUL | findstr /c:"%ShFolder%" 2>NUL 1>NUL || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_HKLM_UserShellFolders )
  FOR /f "usebackq tokens=*" %%a IN (` reg query "%TEMP_Key%" /v "%ShFolder%" 2^>NUL ^| findstr /c:"%ShFolder%" 2^>NUL `) DO SET __VALUE__=%%a
  call :Sub_RegFound
  %DL% exit 0
  %comspec% /c exit 0
:End_HKLM_UserShellFolders

::
:: HKCU_UserShellFolders
::
::  Tries to find the special folder inside the shell
::  special-folders registry key
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
  ) ELSE ( SET "ShFolder=%__SEARCH__%"
  )
  SET "TEMP_Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
  :: testing if `reg` can find the registry key
  reg query "%TEMP_Key%" /v "%ShFolder%" 2>NUL | findstr /c:"%ShFolder%" 2>NUL 1>NUL || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_HKCU_UserShellFolders )
  FOR /f "usebackq tokens=*" %%a IN (` reg query "%TEMP_Key%" /v "%ShFolder%" 2^>NUL ^| findstr /c:"%ShFolder%" 2^>NUL `) DO SET __VALUE__=%%a
  call :Sub_RegFound
  %DL% exit 0
  %comspec% /c exit 0
:End_HKCU_UserShellFolders

::
:: RegFound
::
::  reg.exe command returns entries in a nasty format,
::  we need to filter out the noise and get only the value.
GOTO :End_RegFound
:Sub_RegFound
  %DL% Sub_RegFound
  %DL% %ShFolder%
  FOR %%a IN ("%ShFolder%") DO SET "__temp=%%~a"
  %DL% __temp=%__temp%
  %DL% __VALUE__=%__VALUE__%
  call SET __VALUE__=%%__VALUE__:%__temp%    REG_EXPAND_SZ    =%%
  call SET __VALUE__=%%__VALUE__:%__temp%    REG_SZ    =%%
  SET __VALUE__=%__VALUE__%##XP_TO_7123##
  SET __VALUE__=%__VALUE__: ##XP_TO_7123##=##XP_TO_7123##%
  SET __VALUE__=%__VALUE__:##XP_TO_7123##=%
  REM ECHO.%__VAR__%=%__VALUE__%
:End_RegFound

::
:: Posh
::
::  Uses power-shell script to get special folders defined by .NET
GOTO :End_Posh
:Sub_Posh
  %DL% Sub_Posh
  where powershell 1>nul 2>&1 || ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_Posh
    )
  SET ENV=Environment
  SET ENUM=%ENV%+SpecialFolder
  for /F "usebackq tokens=1 delims=" %%a in (
    ` powershell [%ENUM%]$x^=0^;switch([%ENUM%]::TryParse('%__SEARCH__%'^,$true^,[ref]$x^)^){$true{[%ENV%]::GetFolderPath($x^)}$false{''}}`
  ) do SET __VALUE__=%%~a
  IF "%__VALUE__%"=="" (
    for /F "usebackq tokens=1 delims=" %%a in (
      ` powershell [%ENUM%]$x^=0^;switch([%ENUM%]::TryParse('%__SPEC_DIR_CL%'^,$true^,[ref]$x^)^){$true{[%ENV%]::GetFolderPath($x^)}$false{''}}`
    ) do SET __VALUE__=%%~a
  )
  IF "%__VALUE__%"=="" ( %DL% exit 1
    %comspec% /c exit 1 & GOTO :End_Posh )
  REM ECHO.%__VAR__%=%__VALUE__%
  %DL% exit 0
  %comspec% /c exit 0
:End_Posh

::
:: Set_Colors
::
::  Sets variables that can be used to colorize echoed text on screen
GOTO :End_Set_Colors
:Sub_Set_Colors
  SET _k=[30m&SET _r=[31m&SET _g=[32m&SET _y=[33m&SET _b=[34m&SET _m=[35m&SET _c=[36m&SET _w=[37m&
  SET K=[90m&SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&
  SET N=[0m
:End_Set_Colors

::
:: FOOTER
::
::  Allows to correctly specify the script result by
::  setting return-value and error-level
GOTO :EOF
:dieerrlvl
%comspec% /c exit %errorlevel%