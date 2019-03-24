@echo off
setlocal

:: demonstrating the difference between escaping %% inside a batch file,
:: and trying to escape %% in a cmd environment... conclusion:
:: - %% can only be used to escape the char '%' when inside a BATCH file
:: - ^% can be use to escape char '%' inside a cmd shell

echo.%%PATH%%
:: prints %PATH%

cmd /c echo.^^%%PATH^^%%
:: prints %PATH%

setlocal enabledelayedexpansion

echo.^^!PATH^^!
:: prints !PATH!

cmd /v:on /c echo.^^^^

cmd /v:on /c echo.^^^^^^^^^^!PATH^^^^^^^^^^!
:: prints !PATH!

cmd /v:off /c echo.^^!PATH^^!
:: prints !PATH!

endlocal

cmd /v:on /c echo.^^^^

cmd /v:on /c echo.^^^^!PATH^^^^!
:: prints !PATH!

cmd /v:off /c echo.!PATH!
:: prints !PATH!
