:: Examples:
:: path d "D:\Path" -> d:
:: path x "file.ext" -> .ext
:: path p "D:\Path\file.ext" -> Path\
:: path n "file.ext" -> file
@ECHO OFF
CALL ECHO.%%~%12