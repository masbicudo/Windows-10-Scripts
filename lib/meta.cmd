:: meta.cmd
:: Adds metadata information to batch files
@ECHO OFF
IF defined __IND ( SET "ECHO=ECHO.%__IND%" ) ELSE ( SET "ECHO=ECHO." )
%ECHO%%1 %2 %3 %4 %5 %6 %7 %8 %9
