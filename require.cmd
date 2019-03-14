:: require runs the required script a single time
:: the required script cannot receive parameters
:: Example:
::  require some.cmd
::      runs some.cmd a single time, even if the same command is called again
SETLOCAL
SET __REQ_
FOR /F "delims=;" %%A in (%REQUIRED%) DO 