@echo off
for /f %%i in ('dir /b \rootfs\boot\drivers') do @echo off && \rootfs\boot\drivers\%%i
