@echo off

set /p userpass=<"\rootfs\usr\root.cfg"


:sulogin
if %usrinput% equ root goto suerror
set passwdinput=zero
set /p passwdinput=Password:
if %passwdinput% equ zero goto incorrect
if %passwdinput% equ %userpass% goto initshell
goto incorrect


:incorrect
echo password incorrect
goto end



:initshell
set loggeduser=%usrinput%
prompt %systemhostname%# 
set usrinput=root
cmd /k
set usrinput=%loggeduser%
set loggeduser=""
prompt %systemhostname%$$ 
echo logout
goto end


:suerror
echo you are already root
goto end

:end