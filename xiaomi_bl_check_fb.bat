@echo off

if not exist "fastboot.exe" (
	echo FastBoot not found!
	pause
	exit
)

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
