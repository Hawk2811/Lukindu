@echo off
if "%1" equ "" goto error
goto read




:read
type %1
goto end



:error
echo usage: cat filename
goto end



:end