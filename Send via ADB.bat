@echo off
D:\Programs\AndroidSDK\platform-tools\adb.exe push -p %1 /sdcard/
D:\Programs\AndroidSDK\platform-tools\adb.exe kill-server
