#include <stdio.h>
#include <windows.h>
#include <io.h>

char driverName[255] = "LukinduUSBDriver";
void DRIVER_SUCCESS();
void DRIVER_FAILURE();

int main() {
    // Initialize the driver
    printf("%s: Starting USB driver\n",driverName);
    if(_access("\\rootfs\\dev\\usb", 0) == 0){
        DRIVER_SUCCESS();
    } else{
        DRIVER_FAILURE();
    }
    return 0;
}

void DRIVER_SUCCESS(){
    printf("%s: Driver initialized successfully\n",driverName);
}

void DRIVER_FAILURE(){
    printf("%s: Driver initialization failed\n",driverName);
}