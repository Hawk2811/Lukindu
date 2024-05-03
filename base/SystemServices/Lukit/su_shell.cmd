@echo off
prompt # 
set "PATH=%PATH%;%~d0\rootfs\bin;%PATH%"
cmd /k
goto end


:end