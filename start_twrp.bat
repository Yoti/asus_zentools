rem fast reload into twrp recovery by Yoti v2016-04-03
@echo off

adb start-server 2>nul 1>&2
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
fastboot flash /tmp/recovery.zip recovery_twrp.zip
fastboot flash /tmp/recovery.launcher recovery.launcher
fastboot oem start_partitioning
fastboot flash /system/bin/logcat recovery.trigger.new
fastboot oem stop_partitioning

echo All done!
pause
