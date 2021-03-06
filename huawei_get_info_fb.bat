@echo off

if not exist "fastboot.exe" (
	echo FastBoot not found!
	pause
	exit
)

fastboot wait-for-device 2>nul 1>&2
	fastboot oem get-psid
	fastboot oem get-build-number
	fastboot oem get-product-model
	fastboot getvar vendorcountry
rem ----------------------------
fastboot continue 2>nul 1>&2
rem ----------------------------
echo Done with success!

pause
exit
