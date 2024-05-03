@echo off

set kernelname="Lukindu"

set /p kernelbuilddate=<"\rootfs\System\sysinfo\kernelbuild.plist"
set /p kernelversion=<"\rootfs\System\sysinfo\kernelversion.plist"
set /p systemhostname=<"\rootfs\etc\hostname.txt"
set /p kernelarch=<"\rootfs\System\sysinfo\kernelrelease.plist"
set /p systemname=<"\rootfs\System\sysinfo\osversion.plist"
if "%1" equ "-a" goto show_all
if "%1" equ "-r" goto show_release
if "%1" equ "-v" goto show_kversion
if "%1" equ "-n" goto show_netname
if "%1" equ "-o" goto show_os
if "%1" equ "-m" goto show_machine
if "%1" equ "-s" goto show_kname
if "%1" equ "-i" goto show_platform
if "%1" equ "-p" goto show_processor
if "%1" equ "--help" goto help
goto show_kname

:show_all
echo %kernelversion% %kernelbuilddate% %kernelarch% %systemhostname% %systemname% 
goto end

:show_release
echo %kernelbuilddate%
goto end

:show_kversion
echo %kernelversion%
goto end

:show_netname
echo %systemhostname%
goto end

:show_os
echo %systemname%
goto end

:show_machine
echo %kernelarch%
goto end

:show_kname
echo %kernelname%
goto end
:show_platform
echo unknown
goto end

:show_processor
wmic cpu get name
goto end

:help
echo Print certain system information. With no OPTION, same as -s.

echo -a, --all
echo     print all information, in the following order, except omit -p and -i if unknown: 
echo -s, --kernel-name
echo     print the kernel name 
echo -n, --nodename
echo     print the network node hostname 
echo -r, --kernel-release
echo     print the kernel release 
echo -v, --kernel-version
echo     print the kernel version 
echo -m, --machine
echo     print the machine hardware name 
echo -p, --processor
echo     print the processor type or "unknown" 
echo -i, --hardware-platform
echo     print the hardware platform or "unknown" 
echo -o, --operating-system
echo     print the operating system 
echo --help
echo     display this help and exit 
goto end

:end 