@echo off
if "%1" equ "" goto error
if "%1" equ "-r" goto recursive
if "%1" equ "-f" goto force
if "%1" equ "-rf" recursiveforce
goto delete




:delete
del %1
goto end

:recursive
if "%2" equ "" goto error
rd /s %2
goto end

:force
if "%2" equ "" goto error
del /f %2
goto end

:recursiveforce
if "%2" equ "" goto error
rd /s %2
goto end

:error
echo usage: rm filename
goto end



:end