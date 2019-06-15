:: colorize.cmd
:: Prints stdout with green and stderr with red
:: Example:
::   colorize git fetch
@ECHO OFF
(%* | (findstr /N /A:2A "^")) 2>&1 1>&3 | findstr /N /A:4E "^"