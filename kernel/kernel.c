/*
*
*    Lukindu - Unix Simulator
*    kernel.c
*
*/


//Including libraries
#include <stdio.h>
#include <Windows.h>
#include <string.h>
#include <io.h>

//Defining variables
#define _CRT_SECURE_NO_WARNINGS

//Defining functions
void boot();
void verboseboot();
void singleuser();

int main(int argc, char const *argv[]){//Main function
    if (argc < 2){//checks if it received arguments
        boot();
    } else {
        if (strcmp(argv[1], "-v") == 0  ){
            verboseboot();
        } else if (strcmp(argv[1], "-s") == 0){
            singleuser();
        }
    }
    
           
    return 0;
}

void boot(){
    if(_access("\\rootfs\\System\\Library\\bootScript.cmd", 0) == 0){
        system("\\rootfs\\System\\Library\\bootScript.cmd");
    } else {
        verboseboot();
    }
}

void verboseboot(){//Verbose Boot
    printf("Lukindu/x86\n");
    FILE *file = fopen("\\rootfs\\etc\\versioninfo.sym","r");
    char verinfo[500];
    	if(!file){ //If Failed it returns an error
		printf("FAILED TO LOAD BOOT DATA IN /etc/versioninfo.sym\n");
		exit(2);
	}
    while (fgets(verinfo,500,file)){//Print Version Info
        printf("%s", verinfo);
    }
    fclose(file);//Close file and Continue Boot
    printf("Loading Lukit Framework\n");
    Sleep(3000);
    system("\\rootfs\\System\\Lukit\\Lukit.exe");//Call Lukit 
    Sleep(5000);
	system("\\rootfs\\System\\drvloader.cmd");//Call Driverloader
	Sleep(3000);
	system("\\rootfs\\System\\Services\\initrc.cmd");//Call Init Service
}


void singleuser(){
    printf("Lukindu/x86\n");
    FILE *file = fopen("\\rootfs\\etc\\versioninfo.sym","r");
    char verinfo[500];
    	if(!file){ //If Failed it returns an error
		printf("FAILED TO LOAD BOOT DATA IN /etc/versioninfo.sym\n");
		exit(2);
	}
    while (fgets(verinfo,500,file)){//Print Version Info
        printf("%s", verinfo);
    }
    fclose(file);//Close file and Continue Boot
    printf("Loading Lukit Framework\n");
    Sleep(3000);
    system("\\rootfs\\System\\Lukit\\Lukit.exe");//Call Lukit 
    Sleep(5000);
	system("\\rootfs\\System\\drvloader.cmd");//Call Driverloader
	Sleep(3000);
    printf("\n\nEnter on Single User Shell\n");
	system("\\rootfs\\System\\Lukit\\su_shell.cmd");//Execute Single User Shell
	printf("Continuing boot...\n");//Continue boot on exit 
	Sleep(2000);
	system("\\rootfs\\System\\Services\\initrc.cmd");//Call Init Service
}