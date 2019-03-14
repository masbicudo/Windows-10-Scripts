@ECHO OFF
SETLOCAL
  SET __=outer
  SETLOCAL
    SET __=inner
    ECHO.%__%
  ENDLOCAL
  ECHO.%__%
ENDLOCAL