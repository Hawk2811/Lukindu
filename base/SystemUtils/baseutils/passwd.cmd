@echo off
set /p newpass=New Unix Password: 
echo %newpass% > \rootfs\usr\%usrinput%.cfg