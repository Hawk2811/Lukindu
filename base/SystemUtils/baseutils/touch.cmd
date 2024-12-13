@echo off
if "%1" equ "" goto error
if "%1" equ "-h" goto helplist
if "%1" equ "--help" goto helplist
goto create




:create
echo. > %1
goto end



:error
echo Error: No input file specified. try -h to help
goto end

:helplist
echo Lukindu Baseutils - touch command
echo.
echo touch [filename] - create a new empty file



:end