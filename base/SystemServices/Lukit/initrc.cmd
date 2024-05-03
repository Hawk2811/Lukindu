@echo off
if "%1" equ "--no-xserver" goto loginservice
goto tryxserver




:tryxserver
if exist \rootfs\System\Services\X11Service.cmd ( 
	call \rootfs\System\Services\X11Service.cmd
	goto end
) else (
	call \rootfs\System\Services\loginService.cmd
	goto end
)

:loginservice
call \rootfs\System\Services\loginService.cmd
goto end

:end