@echo off

if not exist "adb.exe" (
	echo ADBridge not found!
	pause
	exit
)

if not exist "fastboot.exe" (
	echo FastBoot not found!
	pause
	exit
)

adb kill-server
adb start-server >nul
cls
echo Connect device with ADB enabled...
adb wait-for-device
echo Devices found:
adb devices
adb reboot bootloader
adb kill-server
fastboot wait-for-device 2>nul 1>&2
	fastboot devices
	fastboot getvar product
	fastboot getvar anti
	fastboot oem device-info
rem ----------------------------
fastboot continue 2>nul 1>&2
rem ----------------------------
echo Done with success!

pause
exit
