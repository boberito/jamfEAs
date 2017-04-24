#!/bin/sh

OpenDNScheck=`ps aux  | grep dnscrypt-proxy | grep sbin | awk '{ print $11 }'`

OpenDNScheck+="."

if [ $OpenDNScheck = "/usr/local/sbin/dnscrypt-proxy." ]; then
	echo "<result>OpenDNS installed & running</result>"
else
	if [ -d "/Applications/OpenDNS Roaming Client" ]; then
		echo "<result>OpenDNS installed but not running</result>"
	else
		echo "<result>OpenDNS NOT installed</result>"
	fi
fi

