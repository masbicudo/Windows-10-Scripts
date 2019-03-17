@echo off
SETLOCAL

:: testing whether path exists
    IF "%3"=="--if-exist" SET __EXIST_079851=1
    IF "%__EXIST_079851%"=="1" IF NOT EXIST %2 GOTO :NOT_FOUND_PATH

:: getting registry environment variable value
    SET __REGISTRY_VAR=
    FOR /F "usebackq tokens=2,* skip=2" %%L IN (
        `reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v %1 2^>nul`
    ) DO SET __REGISTRY_VAR=%%M 2>nul
    IF defined __REGISTRY_VAR SET __REGISTRY_VAR=%__REGISTRY_VAR:~0,-1%

:: checking whether value already exists in the registry environment variable
    call list-item-exists __REGISTRY_VAR %2 || GOTO :NOT_FOUND_REG
        ECHO.\033[90mSYSTEM\033[0m \033[36m%1 already contains %~2\033[0m | cmdcolor
        GOTO :eof
    :NOT_FOUND_REG

:: appending the desired value and saving
    ECHO.\033[90mSYSTEM\033[0m \033[32m%1 += %~2\033[0m | cmdcolor
    call list-insert-item __REGISTRY_VAR %2
    REM IF __REGISTRY_VAR ENDS WITH "\", MUST DOUBLE IT (e.g. "\\")
    IF "%__REGISTRY_VAR:~-1%"=="\" (
        call SETX %1 "%%__REGISTRY_VAR:~0,-1%%\\" /M > nul
    ) ELSE (
        call SETX %1 "%%__REGISTRY_VAR%%" /M > nul
    )

ENDLOCAL

:: checking whether value already exists in the local environment variable and adding
    call list-item-exists %1 %2 || call list-insert-item %1 %2

    GOTO :EOF

:NOT_FOUND_PATH
    ECHO.\033[90mSYSTEM\033[0m \033[91m%1 rejected %~2 (not found)\033[0m

:: NOTES
:: -----
:: 
:: call is used inside code blocks to prevent issue when variable expansions contains the char `)`
:: which causes the premature ending of the code block. This happens for example if the %2 param
:: contains the path "C:\Program Files (x86)". Variables to be protected must have the char '%'
:: doubled when refering to them: e.g. %VAR$ => %%VAR%%
:: Code blocks should be avoided when using parameters like %2. It will not be possible to usebackq
:: the call because after calling %2 could have other meaning. Instead, we should use labels and
:: GOTO's to make IF's and ELSE's.