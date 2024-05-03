/*
*
*    Lukindu - Unix Simulator
*    lukit.c
*
*/

#include <stdio.h>
#include <stdlib.h>
#include <Windows.h>
#include <io.h>


int main(int argc, char const *argv[])
{
    if (_access("\\rootfs\\dev\\root", 0) == 0){ //Check if the UFS Filesystem is correct to boot
        printf("Lukit Framework Started\n");    
    } else {// If not, it triggers an error
        printf("Lukit: Error no Root Filesystem Detected!!\n");
        printf("System is Halted by Lukit Error\n");
        system("pause > nul");
        system("taskkill /f /im mach_kernel.exe");
        return 2;
    } 
    return 0;
}
