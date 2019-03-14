@ECHO OFF
cscript /nologo google-translate.js -in msg.txt > _out_.txt
array-load MSG _out_.txt
array-show MSG
