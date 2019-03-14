@ECHO OFF
CALL CALL :Clear %1 %%%1.length%%
SET "%1.length="
GOTO :EOF
:Clear
FOR /L %%i IN (1,1,%2) DO SET "%1[%%i]="