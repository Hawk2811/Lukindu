@echo off
if "%1" equ "" goto error
if "%1" equ "--help" goto helplist
if "%1" equ "-h" goto helplist
goto read




:read
type %1
goto end



:error
echo No file specified try "cat -h" to help
goto end


:helplist
echo Lukindu Baseutils - cat command
echo.
echo cat filename - View contents of a file
goto end



:end