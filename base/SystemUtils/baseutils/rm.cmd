@echo off
if "%1" equ "" goto error
if "%1" equ "-r" goto recursive
if "%1" equ "-f" goto force
if "%1" equ "-rf" goto recursiveforce
if "%1" equ "-h" goto helplist
if "%1" equ "--help" goto helplist
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

:helplist
echo Lukindu Baseutils - rm command
echo.
echo rm filename - delete file
echo rm -r directory - delete directory and all files inside
echo rm -f filename - force delete file
echo rm -rf directory - force delete directory and all files inside
goto end



:error
echo Error: invalid argument try "rm -h" to help
goto end



:end