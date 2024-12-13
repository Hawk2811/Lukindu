@echo off
if "%1" equ "" goto list
if "%1" equ "-l" goto longlist
if "%1" equ "-la" goto longAll
if "%1" equ "-a" goto All
if "%1" equ "-h" goto helplist
if "%1" equ "--help" goto helplist
goto listdir




:listdir
dir /b %1
goto end



:list
dir /b
goto end


:longlist
if "%2" equ "" goto longlistNoDIR
dir %2
goto end

:longlistNoDIR
dir
goto end

:All
if "%2" equ "" goto AllNoDIR
dir /a /b %2
goto end

:AllNoDIR
dir /a /b
goto end

:longAll
if "%2" equ "" goto longAllNoDIR
dir /a %2
goto end

:longAllNoDIR
dir /a
goto end


:helplist
echo Lukindu Baseutils - ls command
echo.
echo "-a" - show all files
echo "-l" - long listing
echo "-la" - show all files with long listing
echo "-h" or "--help" - show this help message
goto end

:end