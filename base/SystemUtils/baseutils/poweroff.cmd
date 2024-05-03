@echo off
echo SYSTEM SHUTDOWN NOW 
ping -n 3 localhost > nul
TASKKILL /im cmd.exe
taskkill /im mach_kernel.exe