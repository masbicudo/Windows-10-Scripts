::
:: Example:
::  - Read the text of all buttons in the XML file, and get their texts, and set environment variables
::      xml-read some.xml ".//button/text()" --mode cmd --var my_nodes > %tmp%\xpto.cmd & %tmp%/xpto.cmd & set my_
::          my_nodes.length=2
::          my_nodes[0]=Cancel
::          my_nodes[1]=Ok
@ECHO OFF
cscript /nologo "%~dp0xml-read.js" %*