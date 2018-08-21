#!/bin/bash
# A simple bash script to take a screenshot from a current android device using adb

adb shell screencap -p /sdcard/screen.png
adb pull /sdcard/screen.png
adb shell rm /sdcard/screen.png

echo "Saved screencap as screen.png"
