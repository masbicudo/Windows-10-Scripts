@ECHO OFF
SETLOCAL

SET __TEMP=%*
SET __TEMP=%__TEMP:"=%
IF "%__TEMP:--debug-lines=%"=="%__TEMP%" (SET DL=REM) ELSE (
  SET __DL=1
  IF "%__TEMP:--colors=%"=="%__TEMP%" (SET DL=ECHO.DEBUG:) ELSE (SET DL=ECHO.[90mDEBUG:[0m)
)

GOTO :END_HELP
:SUB_HELP
ECHO.%B%set-where script v0.2.8 by MASBicudo%N%
ECHO.
ECHO.This is a tool to locate a file system object and assign it's location to a variable.
ECHO.It will use multiple tools to accomplish it's job.
ECHO.First approach will be with the `where` command, to find the object in one of the pathes in %%PATH%% environment variable.
ECHO.Then, it looks in the registry inside the "App Paths" key.
ECHO.And finally, if Everything tool `es.exe` is installed, it will be used to locate the object using the filesystem journal.
ECHO.
ECHO.%R%Command line:%N%
ECHO.%W%%0 %C%varname%W% %C%object%W% [%C%parts%W%] [%C%options%W%]%N%
ECHO.%C%varname%W%: name of the variable to receive the location of the desired object.
ECHO.%C%object%W%:  file ^| file.ext ^| folder
ECHO.         A file without an extension will be searched by adding each extension in the PATHEXT variable.
ECHO.         A file with an extension will only be located with that specific extension.
ECHO.         A folder name can be located, if Everything tool 'es.exe' is installed.
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

GOTO :END_TESTS
:SUB_TESTS
SETLOCAL
  ECHO.%R%Unit tests:%N%
  ::Testing known target `cmd`, will be handled by `where` command, to find it in one of the pathes in %%PATH%% environment variable
  ECHO.%Y%where%N%
  CALL set-where where_cmd cmd && ECHO.[%G% OK %N%] || ECHO.[%R%FAIL%N%]
  IF /I "%where_cmd%"=="C:\Windows\System32\cmd.exe" ( ECHO.[%G% OK %N%] ) ELSE ECHO.[%R%FAIL%N%]
  ::Testing known target `wordpad`, will be handled by `reg` command, to find it the registry inside the "App Paths" key
  ECHO.%Y%reg%N%
  CALL set-where where_pbrush pbrush && ECHO.[%G% OK %N%] || ECHO.[%R%FAIL%N%]
  IF /I "%where_pbrush%"=="%%SystemRoot%%\System32\mspaint.exe" ( ECHO.[%G% OK %N%] ) ELSE ECHO.[%R%FAIL%N%]
  CALL set-where where_wordpad_exe wordpad.exe && ECHO.[%G% OK %N%] || ECHO.[%R%FAIL%N%]
  IF /I "%where_wordpad_exe%"=="%%ProgramFiles%%\Windows NT\Accessories\WORDPAD.EXE" ( ECHO.[%G% OK %N%] ) ELSE ECHO.[%R%FAIL%N%]
  CALL set-where where_wordpad_exe_dpnx wordpad.exe dpnx && ECHO.[%G% OK %N%] || ECHO.[%R%FAIL%N%]
  IF /I "%where_wordpad_exe_dpnx%"=="%ProgramFiles%\Windows NT\Accessories\WORDPAD.EXE" ( ECHO.[%G% OK %N%] ) ELSE ECHO.[%R%FAIL%N%]
  ::Testing known target `test-set-where-empty`, will be handled by `es` command from Everything by VoidTools
  ECHO.%Y%es%N%
  MKDIR __test_set_where
  COPY NUL __test_set_where\test-set-where-file.exe
  rem misusing ping command to sleep for 1s
  ping 127.0.0.1 -n 2 > nul
  CALL set-where where_some test-set-where-file && ECHO.[%G% OK %N%] || ECHO.[%R%FAIL%N%]
  CALL set-where where_some_exe test-set-where-file.exe && ECHO.[%G% OK %N%] || ECHO.[%R%FAIL%N%]
  DEL __test_set_where\test-set-where-file.exe
  RMDIR __test_set_where
  CALL set-where where_random kHuQQPTHZlswRR3J9jPz67sn-0-O0v09IkyaFGyJwyVbE5BkwTlnJPLr16IgFiLZPK3DarlhjGu9aCE5JJASww && ECHO.[%R%FAIL%N%] || ECHO.[%G% OK %N%]
ENDLOCAL
GOTO :EOF
:END_TESTS

GOTO :END_SET_COLORS
:SUB_SET_COLORS
SET _k=[30m&SET _r=[31m&SET _g=[32m&SET _y=[33m&SET _b=[34m&SET _m=[35m&SET _c=[36m&SET _w=[37m&
SET K=[90m&SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&
SET N=[0m
GOTO :EOF
:END_SET_COLORS

SET _num_vars=__VERBOSE__;__ORD__
SET _bool_vars=__CLEAR__;__KEEP__;__HELP__;__SET__;__UNIT_TESTS__
SET _str_vars=__VAR__;__SEARCH__;__EXT__;__DPNX__;__FILTER__
SET _char_vars=__d;__p;__n;__x

FOR %%C IN (%_num_vars%;%_str_vars%;%_bool_vars%;%_char_vars%) DO SET %%C=
FOR %%C IN (_k;_r;_g;_y;_b;_m;_c;_w;K;R;G;Y;B;M;C;W;N) DO SET %%C=

SET __ORD__=1
SET __VERBOSE__=1
SET __CLEAR__=F
SET __KEEP__=F
SET __HELP__=F
SET __SET__=T
SET __UNIT_TESTS__=F
::SET __DPNX__=dpnx
:BEGIN_LOOP_PARAMS
%DL% IF "%~1"=="" IF [%1]==[] GOTO :END_LOOP_PARAMS
IF "%~1"=="" IF [%1]==[] GOTO :END_LOOP_PARAMS
%DL% SET __ARG__=%1
SET __ARG__=%1
IF "%~1"=="--verbose" (
%DL% SET __VERBOSE__=2
  SET __VERBOSE__=2
  SHIFT
  IF "%~2"=="0" ( SET "__VERBOSE__=0" & SHIFT )
  IF "%~2"=="1" ( SET "__VERBOSE__=1" & SHIFT )
  IF "%~2"=="2" ( SET "__VERBOSE__=2" & SHIFT )
  IF "%~2"=="3" ( SET "__VERBOSE__=3" & SHIFT )
) ELSE IF "%~1"=="--clear"      ( SET "__CLEAR__=T"      & SHIFT
) ELSE IF "%~1"=="--debug-lines" (                          SHIFT
) ELSE IF "%~1"=="--keep"       ( SET "__KEEP__=T"       & SHIFT
) ELSE IF "%~1"=="--test"       ( SET "__SET__=F"        & SHIFT
) ELSE IF "%~1"=="--unit-tests" ( SET "__UNIT_TESTS__=T" & SHIFT
) ELSE IF "%~1"=="--help"       ( SET "__HELP__=T"       & SHIFT
) ELSE IF "%~1"=="-help"        ( SET "__HELP__=T"       & SHIFT
) ELSE IF "%~1"=="/?"           ( SET "__HELP__=T"       & SHIFT
) ELSE IF "%~1"=="--filter"     ( SET __FILTER__="%~2"   & SHIFT & SHIFT
) ELSE IF "%~1"=="--colors"     ( CALL :SUB_SET_COLORS   & SHIFT
) ELSE IF "%__ORD__%"=="1" (
%DL% SET "__VAR__=%~1"
  SET "__VAR__=%~1"
  SET "__ORD__=2"
  SHIFT
) ELSE IF "%__ORD__%"=="2" (
%DL% SET "__SEARCH__=%~1"
  SET "__SEARCH__=%~1"
  SET "__EXT__=%~x1"
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
%DL% SET __DPNX__=_%__DPNX__%
SET __DPNX__=_%__DPNX__%
IF NOT "%__DPNX__:d=%" == "%__DPNX__%" SET __d=d
IF NOT "%__DPNX__:p=%" == "%__DPNX__%" SET __p=p
IF NOT "%__DPNX__:n=%" == "%__DPNX__%" SET __n=n
IF NOT "%__DPNX__:x=%" == "%__DPNX__%" SET __x=x
FOR %%C IN (__ARG__) DO SET %%C=
SET "__DPNX__=%__d%%__p%%__n%%__x%"
IF DEFINED __FILTER__ SET __FILTER__=^^^| findstr /I %__FILTER__:\=\\%
:: Printing parameters
  SETLOCAL EnableDelayedExpansion
  IF %__VERBOSE__% GEQ 3 (
    FOR /F "tokens=1* usebackq delims==" %%a IN (` SET __ `) DO (
      SET _=%%a
      CALL SET __=%%_str_vars:!_!=%%
      IF NOT "!__!"=="%_str_vars%" ECHO.%W%%%a%K%=%_y%%%b%N%
      CALL SET __=%%_bool_vars:!_!=%%
      IF NOT "!__!"=="%_bool_vars%" ECHO.%W%%%a%K%=%_c%%%b%N%
      CALL SET __=%%_num_vars:!_!=%%
      IF NOT "!__!"=="%_num_vars%" ECHO.%W%%%a%K%=%M%%%b%N%
    )
    IF DEFINED __DL ECHO.%W%__DL%K%=%M%%__DL%%N%
  )
  ENDLOCAL
IF "%__UNIT_TESTS__%"=="T" CALL :SUB_TESTS
IF "%__HELP__%"=="T" CALL :SUB_HELP
IF %__ORD__% LEQ 2 GOTO :EOF

:IF_Begin

:: testing if `where` can find the file
:Where_Then
%DL% SET __Where_Found=0
  SET __Where_Found=0
  IF %__VERBOSE__% GEQ 2 ECHO.%C% where "%__SEARCH__%" 2^>NUL %__FILTER__%%N%
  FOR /F "tokens=* usebackq" %%F IN (` where "%__SEARCH__%" 2^>NUL %__FILTER__% `) DO (
    SET "__VALUE__=%%F"
    SET __Where_Found=1
%DL% GOTO Exit_Where_For
    GOTO Exit_Where_For
  )
  :Exit_Where_For
  IF "%__Where_Found%"=="1" GOTO ShowResult
:Where_Else

:: testing if `reg` can find an entry at "App Paths"
:RegistryLookup_Then
%DL% SET "__Search_Key=HKLM\Software\Microsoft\Windows\CurrentVersion\App Paths\%__SEARCH__%"
  SET "__Search_Key=HKLM\Software\Microsoft\Windows\CurrentVersion\App Paths\%__SEARCH__%"
  SET __Reg_Found=0
  IF "%__EXT__%"=="" (
    FOR %%e IN (%PATHEXT%) DO (
      IF %__VERBOSE__% GEQ 2 ECHO.%C% reg query "%__Search_Key%%%e" /ve 2^>NUL ^| findstr REG_ 2^>NUL %__FILTER__%%N%
      FOR /F "tokens=2* usebackq" %%a IN (` reg query "%__Search_Key%%%e" /ve 2^>NUL ^| findstr REG_ 2^>NUL %__FILTER__% `) DO (
        SET "__VALUE__=%%~b"
        SET __Reg_Found=1
%DL% GOTO Exit_Ref_For
        GOTO Exit_Ref_For
      )
    )
  ) ELSE (
    IF %__VERBOSE__% GEQ 2 ECHO.%C% reg query "%__Search_Key%" /ve 2^>NUL ^| findstr REG_ 2^>NUL %__FILTER__%%N%
    FOR /F "tokens=2* usebackq" %%a IN (` reg query "%__Search_Key%" /ve 2^>NUL ^| findstr REG_ 2^>NUL %__FILTER__% `) DO (
      SET "__VALUE__=%%~b"
      SET __Reg_Found=1
%DL% GOTO Exit_Ref_For
      GOTO Exit_Ref_For
    )
  )
  :Exit_Ref_For
  IF "%__Reg_Found%"=="1" GOTO ShowResult
:RegistryLookup_Else

:: testing if `es` can find the file ( command line utility from VoidTools Everything search )
:ES_Then
%DL% where es.exe 2^>NUL 1^>NUL ^|^| GOTO ES_Else
  where es.exe 2>NUL 1>NUL || GOTO ES_Else
  SET "__Search_Findstr=\%__SEARCH__%"
  SET "__Search_Findstr=%__Search_Findstr:\=\\%"
  SET __ES_Found=0
  IF "%__EXT__%"=="" (
    FOR %%e IN (%PATHEXT%) DO (
      IF %__VERBOSE__% GEQ 2 ECHO.%C% es.exe "%__SEARCH__%%%e" "*%%e" ^| findstr /I /E "\\%__SEARCH__%%%e" 2^>NUL %__FILTER__%%N%
      FOR /F "tokens=* usebackq" %%a IN (` es.exe "%__SEARCH__%%%e" "*%%e" ^| findstr /I /E "\\%__SEARCH__%%%e" 2^>NUL %__FILTER__% `) DO (
        SET "__VALUE__=%%a"
        SET __ES_Found=1
%DL% GOTO Exit_ES_For
        GOTO Exit_ES_For
      )
    )
    IF %__VERBOSE__% GEQ 2 ECHO.%C% es.exe "%__SEARCH__%" ^| findstr /I /E "%__Search_Findstr%" 2^>NUL %__FILTER__%%N%
    FOR /F "tokens=* usebackq" %%a IN (` es.exe "%__SEARCH__%" ^| findstr /I /E "%__Search_Findstr%" 2^>NUL %__FILTER__% `) DO (
      SET "__VALUE__=%%a"
      SET __ES_Found=1
%DL% GOTO Exit_ES_For
      GOTO Exit_ES_For
    )
  ) ELSE (
    IF %__VERBOSE__% GEQ 2 ECHO.%C% es.exe "%__SEARCH__%" "*%__EXT__%" ^| findstr /I /E "%__Search_Findstr%" 2^>NUL %__FILTER__%%N%
    FOR /F "tokens=* usebackq" %%a IN (` es.exe "%__SEARCH__%" "*%__EXT__%" ^| findstr /I /E "%__Search_Findstr%" 2^>NUL %__FILTER__% `) DO (
      SET "__VALUE__=%%a"
      SET __ES_Found=1
%DL% GOTO Exit_ES_For
      GOTO Exit_ES_For
    )
  )
  :Exit_ES_For
  IF "%__ES_Found%"=="1" GOTO ShowResult
:ES_Else

:IF_Else
  GOTO Raise_Error
:IF_End

:ShowResult
%DL% IF DEFINED __DPNX__ (
%DL% ECHO."%__VALUE__%"
  IF DEFINED __DPNX__ (
    FOR /F "tokens=* usebackq delims=" %%i IN (`ECHO."%__VALUE__%"`) DO (
	  echo.%%~%__DPNX__%i
      CALL SET "__VALUE__=%%~%__DPNX__%i"
    )
  )
%DL% IF DEFINED __p IF NOT DEFINED __n IF NOT DEFINED __x SET
  IF DEFINED __p IF NOT DEFINED __n IF NOT DEFINED __x SET "__VALUE__=%__VALUE__:~0,-1%"
  IF DEFINED __d IF NOT DEFINED __p (
    IF DEFINED __n ( SET "__VALUE__=%__VALUE__::=:\%"
    ) ELSE IF DEFINED __x ( SET "__VALUE__=%__VALUE__::=:\%"
    )
  )
%DL% IF %__VERBOSE__% GEQ 1 ECHO.%W%%__VAR__%%K%=%Y%%__VALUE__%%N%
  IF %__VERBOSE__% GEQ 1 ECHO.%W%%__VAR__%%K%=%Y%%__VALUE__%%N%
  IF DEFINED %__VAR__% IF "%__KEEP__%"=="T" SET __SET__=F
  ENDLOCAL & IF "%__SET__%"=="T" SET "%__VAR__%=%__VALUE__%"
  EXIT /B 0

:Raise_Error
  IF %__VERBOSE__% GEQ 1 ECHO.%R%File not found%N%
  ENDLOCAL & IF "%__SET__%"=="T" IF "%__CLEAR__%"=="T" SET "%__VAR__%="
  :: calling `where` with invalid argument to set errorlevel and return value
  where / 2>NUL 1>NUL
