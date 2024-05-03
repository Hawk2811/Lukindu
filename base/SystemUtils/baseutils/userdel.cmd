@echo off
if "%1" equ "" goto error
goto deleteuser




:deleteuser
if not %usrinput% equ root goto privilegeerror
del \rootfs\usr\"%1.cfg"
goto end



:privilegeerror
echo Only SuperUser can do this
goto end

:error
echo ERROR No User to delete
echo usage: userdel username
goto end


:end