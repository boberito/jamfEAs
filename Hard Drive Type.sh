#!/bin/bash

MediumType=`system_profiler SPStorageDataType | grep "Medium Type:" | awk '{ print $3 }'`

echo "<result>$MediumType</result>"