@echo off
if "%1" equ "" goto list
if "%1" equ "-l" goto longlist
if "%1" equ "-la" goto longAll
if "%1" equ "-a" goto All
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
dir /a:h /b %2
goto end

:AllNoDIR
dir /a:h /b
goto end

:longAll
if "%2" equ "" goto longAllNoDIR
dir /a:h %2
goto end

:longAllNoDIR
dir /a:h
goto end


:end