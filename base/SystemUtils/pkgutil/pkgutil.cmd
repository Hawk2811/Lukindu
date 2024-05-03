@echo off
if "%1" equ "--add" goto func_installpkg
if "%1" equ "--info" goto func_getinfo
if "%1" equ "--del" goto func_uninstall
if "%1" equ "--version" goto version
if "%1" equ "--help" goto helplist
goto error

:func_installpkg
if "%2" equ "" goto nopkg
goto installpkg

:installpkg
mkdir \rootfs\etc\packages\%2
unzip %2.pkg -d \rootfs\etc\package_cache
if not exist \rootfs\etc\package_cache\uninstall.bat ( 
	goto invalidpkg
) else (
	REM PASS
)
if not exist \rootfs\etc\package_cache\pkg_info.txt ( 
	goto invalidpkg
) else (
	REM PASS
)
if not exist \rootfs\etc\package_cache\install.bat ( 
	goto invalidpkg
) else (
	call \rootfs\etc\package_cache\install.bat
	copy \rootfs\etc\package_cache\uninstall.bat \rootfs\etc\packages\%2\uninstall.bat
	copy \rootfs\etc\package_cache\pkg_info.txt \rootfs\etc\packages\%2\pkg_info.txt
	rd /s /q \rootfs\etc\package_cache
	mkdir \rootfs\etc\package_cache
	goto end
)

:func_getinfo
if "%2" equ "" goto nopkg
type \rootfs\etc\packages\%2\pkg_info.txt

goto end

:func_uninstall
if "%2" equ "" goto nopkg
call \rootfs\etc\packages\%2\uninstall.bat
rd /s /q \rootfs\etc\packages\%2
goto end

:nopkg
echo No Package Selected!
goto end

:invalidpkg
echo Invalid Package file!
goto end

:error
echo Invalid Args! Try pkgutil --help
goto end

:helplist
echo Lukindu Package utility
echo --add - install new package
echo --info - get info of package
echo --del - uninstall package
echo --version - version of PKGUtil
goto end


:version
echo Lukindu PKGUtil 1.0
goto end

:end