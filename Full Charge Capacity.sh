#!/bin/sh

FullCharge=`system_profiler SPPowerDataType | grep "Full Charge"`


echo "<result>$FullCharge</result>"