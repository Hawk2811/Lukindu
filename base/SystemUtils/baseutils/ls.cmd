@echo off
if "%1" equ "" goto list
goto listdir




:listdir
dir /b %1
goto end



:list
dir /b
goto end



:end