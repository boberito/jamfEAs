#!/bin/sh

DRIVEMODEL=`system_profiler SPSerialATADataType | grep Model | head -1 | cut -c 18-40`
echo "<result>$DRIVEMODEL</result>"
