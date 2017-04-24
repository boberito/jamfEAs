#!/bin/sh

if [ -a "/var/.faculty" ]; then
	echo "<result>Faculty</result>"

elif [ -a "/var/.staff" ]; then
	echo "<result>Staff</result>"

elif [ -a "/var/.student" ]; then
	echo "<result>Student</result>"

else
	echo "<result></result>"
fi
