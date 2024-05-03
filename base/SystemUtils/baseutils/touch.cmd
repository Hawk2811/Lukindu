@echo off
if "%1" equ "" goto error
goto create




:create
echo. > %1
goto end



:error
echo usage: touch filename
goto end



:end