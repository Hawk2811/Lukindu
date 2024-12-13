#include <windows.h>
#include <setupapi.h>
#include <devguid.h>
#include <stdio.h>
#include <tchar.h>
#include <string.h>


char driverName[255] = "LukinduSATAController";

void DRIVER_FAILURE();
void DRIVER_SUCCESS();
void DRIVER_MAIN();
void ListSATAControllers();
void ListDrives();


#pragma comment(lib, "setupapi.lib")

void ListSATAControllers() {
    HDEVINFO deviceInfoSet;
    SP_DEVINFO_DATA deviceInfoData;
    DWORD i;

    // Get a handle to the device information set for all devices
    deviceInfoSet = SetupDiGetClassDevs(NULL, NULL, NULL, DIGCF_ALLCLASSES | DIGCF_PRESENT);
    if (deviceInfoSet == INVALID_HANDLE_VALUE) {
        DRIVER_FAILURE();
        return;
    }

    deviceInfoData.cbSize = sizeof(SP_DEVINFO_DATA);

    // Enumerate through the devices in the set
    for (i = 0; SetupDiEnumDeviceInfo(deviceInfoSet, i, &deviceInfoData); i++) {
        TCHAR deviceName[256];
        DWORD dataType, buffersize = sizeof(deviceName);

        // Get the device description
        if (SetupDiGetDeviceRegistryProperty(deviceInfoSet, &deviceInfoData,
                                             SPDRP_DEVICEDESC, &dataType,
                                             (BYTE*)deviceName, buffersize, NULL)) {
            // Check if the device description contains "SATA"
            if (_tcsstr(deviceName, _T("SATA")) != NULL) {
                printf("%s: Found SATA Controller: %s\n", driverName,deviceName);
                DRIVER_SUCCESS();
            }

        }
    }

    // Cleanup
    SetupDiDestroyDeviceInfoList(deviceInfoSet);
}

void DRIVER_SUCCESS(){//Execute in case of success
    printf("%s: Driver Started Successfully\n", driverName);
}

void DRIVER_FAILURE(){//Execute in case of failure
    printf("%s: Driver Failed to Start\n", driverName);
}

int main() {
    DRIVER_MAIN();
    return 0;
}

void DRIVER_MAIN(){
    // Execute the driver tasks
    ListSATAControllers();
    ListDrives();
}


void ListDrives() {
    DWORD drives = GetLogicalDrives(); // Get a bitmask of the logical drives
    if (drives == 0) {
        DRIVER_FAILURE();
        return;
    }

    printf("%s: Detecting Disk and CD-ROM Drives:\n",driverName);
    for (char letter = 'A'; letter <= 'Z'; letter++) {
        // Check if the drive is present
        if (drives & (1 << (letter - 'A'))) {
            char drive[4]; // Drive letter + ":\"
            sprintf(drive, "%c:\\", letter);
            UINT driveType = GetDriveType(drive); // Get the type of the drive
            Sleep(1000);
            // Print drive information based on its type
            if (driveType == DRIVE_FIXED) {
                printf("%s - Disk Drive\n", drive);
            } else if (driveType == DRIVE_CDROM) {
                printf("%s - CD-ROM Drive\n", drive);
            }
        }
    }
}