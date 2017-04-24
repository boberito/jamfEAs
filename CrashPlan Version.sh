#!/bin/sh

CPVersion=`defaults read /Applications/CrashPlan.app/Contents/Info.plist  CFBundleVersion`
echo "<result>$CPVersion</result>"
