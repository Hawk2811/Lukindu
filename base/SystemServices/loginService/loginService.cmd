@echo off


:startlogin
set /p systemhostname=<\rootfs\etc\hostname.txt
if exist "\rootfs\etc\autologin.d" goto autologin
goto login

:autologin
echo %systemhostname% Login
echo.
set /p usrinput=<\rootfs\etc\autologin.d
echo Login:(AutoLogin)
goto initshell

:login
set passwdinput=zero
set usrinput=zero
echo %systemhostname% Login
echo.
set /p usrinput=Login: 
if %usrinput% equ zero goto login
if exist \rootfs\usr\%usrinput%.cfg goto password
goto login

:password
set /p userpass=<"\rootfs\usr\%usrinput%.cfg"
set /p passwdinput=Password:
if %passwdinput% equ zero goto incorrect
if %passwdinput% equ %userpass% goto initshell
goto incorrect



:incorrect
echo password incorrect
goto login



:initshell
echo Last Login %date% %time%
set HOME=\rootfs\Users\%usrinput%
type \rootfs\etc\motd.txt
call \rootfs\bin\shell.cmd
cls
goto login