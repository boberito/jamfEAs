#!/bin/sh

DyknowVersion=`defaults read /Applications/.cloud/DyKnow.app/Contents/Info.plist CFBundleShortVersionString`
echo "<result>$DyknowVersion</result>"
