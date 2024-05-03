@echo off

if not %usrinput% equ root goto privilegeerror
goto createnewuser


:createnewuser
set /p newuser=New Unix Username: 
set /p newpass=New Unix Password: 
echo %newpass% > \rootfs\usr\%newuser%.cfg
mkdir \rootfs\Users\%newuser%
goto end


:privilegeerror
echo Only SuperUser can do this
goto end


:end