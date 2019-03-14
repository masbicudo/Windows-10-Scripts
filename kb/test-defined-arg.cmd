:: Examples:
:: test-defined-arg
::    [nothing is displayed]
:: test-defined-arg ===,,,===
::    [nothing is displayed]
:: test-defined-arg "a b"
::    1="a b"
:: test-defined-arg "a b"xpto" d"
::    1="a b"xpto" d"

@ECHO OFF
SETLOCAL

IF NOT [%1] == [] ECHO.1=%1
IF NOT [%2] == [] ECHO.2=%2
