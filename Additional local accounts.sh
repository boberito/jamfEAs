#!/bin/sh

#Q is the management/admin account

MoreThanQ=$(dscl . list /Users UniqueID | awk '{ if ($2 > 501 && $2 < 1000) print $1}')
if [ -z "$MoreThanQ" ]; then
    echo "<result>No Additional Users Found</result>"
else
    echo "<result>$MoreThanQ</result>"
fi
