@ECHO OFF
SETLOCAL
set script_name=%0

:: line debugger
SET __TEMP=%*
SET __TEMP=%__TEMP:"=%
IF "%__TEMP:--debug-lines=%"=="%__TEMP%" (SET DL=REM) ELSE (
  SET __DL=1
  IF "%__TEMP:--colors=%"=="%__TEMP%" (SET DL=ECHO.DEBUG:) ELSE (SET DL=ECHO.[90mDEBUG:[0m)
)

:: help
GOTO :END_HELP
:SUB_HELP
ECHO.%B%%script_name% script v0.0.1 by MASBicudo%N%
ECHO.
ECHO.This is a tool to extract path info and assign it to another variable.
ECHO.
ECHO.%R%Command line:%N%
ECHO.%W%%script_name% %C%varname%W% %C%path%W% %C%parts%W% [%C%options%W%]%N%
ECHO.%C%varname%W%: name of the variable to receive the info.
ECHO.%C%path%W%: path to get info from.
ECHO.%C%parts%W%:   %Y%d%W% ^| %Y%p%W% ^| %Y%n%W% ^| %Y%x%N%
ECHO.         %Y%d%N% - drive letter followed by double collons ":", e.g.: %_y%C:%N%
ECHO.         %Y%p%N% - path of file, starting but not ending with backslash "\", e.g.: %_y%\DirA\DirB%N%
ECHO.             unless %Y%n%N% or %Y%x%N% are specified, in which case a backslash is used as connector.
ECHO.             e.g.: %Y%pnx%N% will give %_y%\DirA\DirB\file.exe%N%
ECHO.         %Y%n%N% - file name without extension, e.g.: %_y%file%N%
ECHO.         %Y%x%N% - extension of the file, preceeded by a dot ".", e.g.: %_y%.exe%N%
ECHO.         Multiple can be specified, e.g.: %Y%dp%N%, %Y%nx%N%
ECHO.         Nota that variables in the path will get expanded:
ECHO.             %Y%%%%_y%USERPROFILE%Y%%%%_y%\AppData\Roaming%N% --^> %_y%%USERPROFILE%\AppData\Roaming%N%
ECHO.         Can be defined through environment variable %B%__DPNX__%N%.
ECHO.%C%options%W%:
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
ECHO.         %C%--test%N%: does not set variables, only displays output and returns ERRORLEVEL.
ECHO.             Env var with oposite meaning: %B%__SET__%N% = %W%[%Y% T %W%^|%Y% F %W%]%Y%%N%
ECHO.         %C%--unit-tests%N%: runs unit tests; Env var: %B%__UNIT_TESTS__%N% = %W%[%Y% T %W%^|%Y% F %W%]%Y%%N%
ECHO.         %C%--debug-lines%N%: debug important lines
ECHO.
ECHO.%R%ERRORLEVEL:%N%
ECHO.The ERRORLEVEL is set depending on the source variable having a path or not.
ECHO.If it is a path, it is set to something other than 0 (fail).
ECHO.Otherwise, ERRORLEVEL is set to 0 (ok).
ECHO.
ECHO.%R%Examples:%N%
ECHO.%N%%script_name% nx_cmd_exe "C:\Windows\System32\cmd.exe" nx%N%
ECHO.  %W%nx_cmd_exe%K%=%Y%cmd.exe%N%
GOTO :EOF
:END_HELP

:: tests
GOTO :END_TESTS
:SUB_TESTS
SETLOCAL
  ECHO.%R%Unit tests:%N%

  ::Test #1 - nx
  ECHO.%Y%where%N%
  call %script_name% nx_cmd_exe "C:\Windows\System32\cmd.exe" nx && ECHO.[%G% OK %N%] || ECHO.[%R%FAIL%N%]
  IF /I "%nx_cmd_exe%"=="cmd.exe" ( ECHO.[%G% OK %N%] ) ELSE ECHO.[%R%FAIL%N%]

ENDLOCAL
GOTO :EOF
:END_TESTS

:: colors
GOTO :END_SET_COLORS
:SUB_SET_COLORS
SET _k=[30m&SET _r=[31m&SET _g=[32m&SET _y=[33m&SET _b=[34m&SET _m=[35m&SET _c=[36m&SET _w=[37m&
SET K=[90m&SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&
SET N=[0m
GOTO :EOF
:END_SET_COLORS

:: Clearing color variables
FOR %%C IN (_k;_r;_g;_y;_b;_m;_c;_w;K;R;G;Y;B;M;C;W;N) DO SET %%C=

:: Initializing parameter variables
SET _num_vars=__VERBOSE__;__ORD__
SET _bool_vars=__CLEAR__;__KEEP__;__HELP__;__SET__;__UNIT_TESTS__;__COLORS__
SET _str_vars=__VAR__;__PATH__;__DPNX__
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
) ELSE IF "%~1"=="--no-colors"  ( SET __COLORS__=F&        SHIFT
) ELSE IF "%~1"=="--colors"     ( SET __COLORS__=T&        SHIFT
) ELSE IF "%__ORD__%"=="1" (
  %DL% SET "__VAR__=%~1"
  SET "__VAR__=%~1"
  SET "__ORD__=2"
  SHIFT
) ELSE IF "%__ORD__%"=="2" (
  %DL% SET "__PATH__=%~1"
  SET "__PATH__=%~1"
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

IF  /I "%__UNIT_TESTS__%"=="T" call :SUB_TESTS
IF  /I "%__HELP__%"=="T" call :SUB_HELP
IF %__ORD__% LEQ 3 GOTO :EOF

:IF_Begin
%DL% :IF_Begin
:: if ( is dir or is file )

  SETLOCAL
  PUSHD %__PATH__% 2>NUL && SET IS_DIR=1 & POPD
  IF defined IS_DIR (
    ENDLOCAL
    GOTO :IF_Then
  )
  ENDLOCAL
  IF exist "%__PATH__%" GOTO :IF_Then
  GOTO :IF_Else

:IF_Then
%DL% :IF_Then
:: then

  CALL SET "__VALUE__=%__PATH__%"
  GOTO ShowResult

:IF_Else
%DL% :IF_Else
:: else

  GOTO Raise_Error

:IF_End
%DL% :IF_End

:ShowResult
  :: DPNX flags
  %DL% IF DEFINED __DPNX__ ...
  %DL% ECHO."%__VALUE__%"
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
  %DL% IF %__VERBOSE__% GEQ 1 ECHO.%W%%__VAR__%%K%=%Y%%__VALUE__%%N%
  IF %__VERBOSE__% GEQ 1 ECHO.%W%%__VAR__%%K%=%Y%%__VALUE__%%N%
  IF DEFINED %__VAR__% IF /I "%__KEEP__%"=="T" SET __SET__=F
  ENDLOCAL & IF /I "%__SET__%"=="T" SET "%__VAR__%=%__VALUE__%"

  EXIT /B 0

:Raise_Error
  IF %__VERBOSE__% GEQ 1 ECHO.%R%File not found%N%
  ENDLOCAL & IF /I "%__SET__%"=="T" IF /I "%__CLEAR__%"=="T" SET "%__VAR__%="
  :: calling `where` with invalid argument to set errorlevel and return value
  where / 2>NUL 1>NUL
