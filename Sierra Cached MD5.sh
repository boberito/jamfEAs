#!/bin/sh

sierraMD5=`md5 "/Library/Application Support/JAMF/Waiting Room/Install macOS Sierra.InstallESD.dmg" | cut -d " " -f8`
if [ "$sierraMD5" == "1ed263faeeafe26d7bcdad8947532cd5" ]; then
    echo "<result>Cached Correctly</result>"
else
    echo "<result>Not Cached</result>"
fi
