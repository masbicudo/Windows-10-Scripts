@ECHO OFF
SETLOCAL EnableDelayedExpansion
FOR /L %%i IN (1,1,!%1.length!) DO (
  IF DEFINED %1[%%i] (
    ECHO.!%1[%%i]!>>%2
  ) ELSE (
    ECHO.>>%2
  )
)