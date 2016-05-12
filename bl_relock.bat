@echo off

if not exist "adb.exe" (
	echo ADB not found!
	pause
	exit
)

adb kill-server
adb start-server >nul
echo Connect device with ADB enabled...
adb wait-for-device
echo Devices found:
adb devices

adb -d push files/flash-ifwi /data/local/tmp/flash-ifwi
adb -d push files/if-locked.bin /data/local/tmp/if-locked.bin
adb -d shell su -c 'chmod 777 /data/local/tmp/flash-ifwi'
adb -d shell su -c '/data/local/tmp/flash-ifwi --flash-ifwi /data/local/tmp/if-locked.bin'
adb -d shell rm -f /data/local/tmp/flash-ifwi
adb -d shell rm -f /data/local/tmp/if-unlocked.bin

adb kill-server
echo Done with success!

pause
exit
