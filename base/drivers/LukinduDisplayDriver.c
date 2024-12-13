#include <stdio.h>
#include <Windows.h>
#include <io.h>
#include <wbemidl.h>


char driverName[255] = "LukinduDisplayDriver";
void setcolor(WORD color);
void resetcolors();
void DRIVER_SUCCESS();
void DRIVER_MAIN();
void DRIVER_FAILURE();

int main(){
    DRIVER_MAIN();
    return 0;
}

void DRIVER_MAIN(){
    printf("%s: Starting Display Driver\n",driverName);
    Sleep(1000);
    if(_access("\\rootfs\\dev\\display", 0) == 0){
        DRIVER_SUCCESS();
    } else {
        DRIVER_FAILURE();
    }
}


void DRIVER_SUCCESS(){
    DISPLAY_DEVICE dd;
    dd.cb = sizeof(dd);
    
    // Enumerate display devices
    for (int deviceIndex = 0; EnumDisplayDevices(NULL, deviceIndex, &dd, 0); deviceIndex++) {
        // Check if the device is a video card
        if (dd.StateFlags & DISPLAY_DEVICE_ACTIVE) {
            printf("Video Card: %s\n", dd.DeviceString);
        }
    }
    printf("%s: ",driverName);//Colored text 
    setcolor(1);
    printf("C");
    setcolor(2);
    printf("O");
    setcolor(6);
    printf("L");
    setcolor(4);
    printf("O");
    setcolor(5);
    printf("R");
    resetcolors();
    printf(" Display Driver Loaded Successfully\n"); 
}

void DRIVER_FAILURE(){
    printf("%s: Display Driver Failed to Load\n",driverName);
}








void setcolor(WORD color){//Code to change color of terminal
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),color);
}

void resetcolors(){//Code to reset color of terminal
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),7);
}