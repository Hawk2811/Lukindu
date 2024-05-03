@echo off
rem Compiler configuration
set CC=clang -v
echo Building Lukindu
mkdir build
%CC% kernel\kernel.c -o build\mach_kernel.exe
mkdir build\dev
mkdir build\bin
mkdir build\usr
mkdir build\System
mkdir build\System\Lukit
%CC% base\SystemServices\Lukit\lukit.c -o build\System\Lukit\Lukit.exe
mkdir build\System\Services
mkdir build\System\sysinfo
copy base\sysinfo\*.plist build\System\sysinfo
echo UFS Filesystem > build\dev\root
copy base\SystemServices\Lukit\initrc.cmd build\System\Services
copy base\SystemServices\DriverLoader\drvloader.cmd build\System
copy base\SystemServices\LoginService\loginService.cmd build\System\Services
copy base\SystemServices\Lukit\su_shell.cmd build\System\Lukit
mkdir build\Users\root
mkdir build\dev
mkdir build\etc
mkdir build\etc\packages
mkdir build\etc\package_cache
mkdir build\usr
mkdir build\bin
mkdir build\boot
mkdir build\boot\drivers
copy base\SystemUtils\baseutils\*.cmd build\bin
copy base\SystemUtils\pkgutil\pkgutil.cmd build\bin\pkgutil.cmd
copy base\SystemUtils\pkgutil\unzip.exe build\bin\unzip.exe
copy base\SystemUtils\pkgutil\zip.exe build\bin\zip.exe
copy base\SystemUtils\pkgutil\bzip2.dll build\bin\bzip2.dll
echo Welcome to Lukindu > build\etc\motd.txt
echo localhost> build\etc\hostname.txt
echo toor> build\usr\root.cfg
echo Build %date% %time%> build\System\sysinfo\kernelbuild.plist
set /p kernelversion=<"build\System\sysinfo\kernelversion.plist"
set /p kernelrelease=<"build\System\sysinfo\kernelrelease.plist"
set /p kernelbuild=<"build\System\sysinfo\kernelbuild.plist"
set /p kernelversionmin=<"build\System\sysinfo\kernelversionmin.plist"
echo %kernelversion% %kernelbuild% %kernelrelease% > build\etc\versioninfo.sym
echo DriverKit %kernelversionmin% >> build\etc\versioninfo.sym
echo > build\System\sysinfo\osversion.plist
goto end




:end