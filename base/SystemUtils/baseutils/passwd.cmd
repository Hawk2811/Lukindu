@echo off
:password
set /p newpass=New Unix Password: 
set /p confirm=Confirm Unix Password:
if not %newpass% equ %confirm% goto retry
echo %newpass% > \rootfs\usr\%usrinput%.cfg
goto end


:retry
echo Passwords do not match. Please try again.
goto password


:end
::DONT ADD CODE HERE