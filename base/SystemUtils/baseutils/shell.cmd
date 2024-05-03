@echo off
if %usrinput% equ root goto rootprompt
goto usrprompt

:usrprompt
prompt %systemhostname%$$ 
if exist  \rootfs\mach_kernel.exe (
	set "PATH=%PATH%;%~d0\rootfs\bin;%PATH%"
) else (
	set "PATH=%PATH%;%~d0\bin;%PATH%"
)

cmd /k
goto end



:rootprompt
prompt %systemhostname%# 
if exist \rootfs\mach_kernel.exe (
	set "PATH=%PATH%;%~d0\rootfs\bin;%PATH%"
) else (
	set "PATH=%PATH%;%~d0\bin;%PATH%"
)
cmd /k
goto end


:end