@echo off
if "%1" equ "" goto error
goto delete




:delete
del %1
goto end



:error
echo usage: rm filename
goto end



:end