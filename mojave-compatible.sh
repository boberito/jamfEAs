#!/bin/sh

determine_space () {
	storage_available=$(df -h / | tail -n 1 | awk '{ print $4 }' | sed "s/[^0-9]//g" | bc)
	if [ $storage_available -lt 20 ]; then
		printf "Failed: Insufficent drive space. Need 20GB to install, found ${storage_available}GB available"
	fi
}

#Determine RAM
check_ram () {
	RAMREQ=4
	RAMInstalled=$(expr $(sysctl hw.memsize | awk -F ": " '{print $2}') / 1024 / 1024 / 1024 )

	if [ $RAMREQ -gt "$RAMInstalled" ]; then
		printf "Failed: Insufficent RAM. Need $RAMREQ GB to install, found $RAMInstalled GB installed"
	fi
}

#Deteremine Mac Model, example MacPro6,1
mainID=$(sysctl hw.model | awk -F '[^0-9]*' '{ print $2 }')
secondaryID=$(sysctl hw.model | awk -F '[^0-9]*' '{ print $3 }')
Model=$(sysctl hw.model | awk -F ': ' '{ print $2 }' | sed 's/[[:digit:][:punct:]]*//g')

#If Mojave is already installed
OS=$(sw_vers | grep ProductVersion | awk '{print $2}' | cut -d "." -f 2)
if [ $OS = "14" ]; then
	printf "<result>10.14 currently installed</result>"
	exit 0
fi

#Check to see if the Mac Model is compatible
if [ "${Model}" = "MacBookAir" ]; then
	if [ ${mainID} -gt 4 ]; then
		printf "<result>Mojave Compatible"
		determine_space
		check_ram
	else
		printf "<result>Not Compatible"
	fi
elif [ "${Model}" = "MacBookPro" ]; then
	if [ ${mainID} -gt 8 ]; then
		printf "<result>Mojave Compatible"
		determine_space
		check_ram
	else
		printf "<result>Not Compatible"
	fi
elif [ "${Model}" = "MacBook" ]; then
	if [ ${mainID} -gt 7 ]; then
		printf "<result>Mojave Compatible"
		determine_space
		check_ram
	else
		printf "<result>Not Compatible"
	fi
elif [ "${Model}" = "iMac" ]; then
	if [ ${mainID} -gt 12 ]; then
		printf "<result>Mojave Compatible"
		determine_space
		check_ram
	else
		printf "<result>Not Compatible"
	fi
elif [ "${Model}" = "iMacPro" ]; then
	if [ ${mainID} -gt 0 ]; then
		printf "<result>Mojave Compatible"
		determine_space
		check_ram
	else
		printf "<result>Not Compatible"
	fi
elif [ "${Model}" = "Macmini" ]; then
	if [ ${mainID} -gt 5 ]; then
		printf "<result>Mojave Compatible"
		determine_space
		check_ram
	else
		printf "<result>Not Compatible"
	fi
elif [ "${Model}" = "MacPro" ]; then
	if [ ${mainID} -gt 4 ]; then
	#Some MacPros due to graphic card issues are not compatible. This "SHOULD" determine that
		system_profiler SPDisplaysDataType | awk '/Chipset Model/,/Displays/{print}' | sed '$d;s/^ *//g' | grep "Metal: " > /dev/null
		if [ $? = 0 ]; then
			printf "<result>Mojave Compatible"
			determine_space
			check_ram
		else
			printf "<result>Not Compatible due to Video Card not supported"
		fi
	else
		printf "<result>Not Compatible"
	fi
else
	printf "<result>Mac Model cannot be determined"
fi
printf  "</result>"
