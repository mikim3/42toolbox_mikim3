#!/bin/bash

cp ./settingsFile/com.apple.driver.AppleBluetoothMultitouch.mouse.plist ~/Library/Preferences/
cp ./settingsFile/com.apple.HIToolbox.plist ~/Library/Preferences/
killall cfprefsd
