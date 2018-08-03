#!/bin/sh

# Find the binariers - if it exists
if [ -f /usr/sbin/dsconfigad ] && [ -f /usr/sbin/sc_auth ]; then

    if [[ $(/usr/sbin/dsconfigad -show) ]] ; then
        users=$((dscl . list /users shell | egrep -v '(^_)|(root)|(/usr/bin/false)' | awk '{print $1}') | grep -v 'ACCOUNT-1-TO-SKIP\|ACCOUNT-2-TO-SKIP')
        printf "<result>"
        for user in $users; do
            
            if [[ $(sudo -u $user /usr/sbin/sc_auth list) ]] ; then
                printf "Native Bound with PIV Paired for $user\n"
            else
                printf "Native Bound without PIV Paired for $user\n"
            fi
            
        done
        printf "</result>"
    else
        echo "<result>Not Native Bound</result>"
    fi
else
    echo "<result>Unable to find required binaries</result>"
    exit 1
fi
