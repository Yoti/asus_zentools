rem fast reload into cwm recovery by Yoti v2016-04-05
@echo off

if not exist "adb.exe" (
	echo ADB not found!
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
adb devices > adb.tmp
echo Will try to find device in ADB mode...
for %%F in (adb.tmp) do (
	if %%~zF GTR 28 (
		echo Success!
		adb reboot bootloader
	)
	if %%~zF LSS 29 echo Not found!
)
del /q adb.tmp
adb kill-server

echo Now will try to find device in FB mode...
fastboot wait-for-device 2>nul 1>&2

echo Success!
fastboot flash /tmp/recovery.zip recovery_cwmr.zip
fastboot flash /tmp/recovery.launcher recovery.launcher
fastboot oem start_partitioning
fastboot flash /system/bin/logcat recovery.trigger.new
fastboot oem stop_partitioning

echo All done!
pause
