@echo off
if not exist "adb.exe" (
	echo ADB not found!
	goto end
)
if not exist "fastboot.exe" (
	echo FastBoot not found!
	goto end
)

adb kill-server
adb start-server >nul
echo Connect device with ADB enabled...
adb wait-for-device
echo Devices found:
adb devices
adb reboot bootloader
fastboot wait-for-device 2>nul 1>&2
echo Some magic started...

echo Some magic ended...
fastboot continue 2>nul 1>&2
echo Done with success!
adb kill-server

:end
pause
exit