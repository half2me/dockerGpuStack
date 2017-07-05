#!/bin/sh

echo $1 | grep "\.intel\.com$" > /dev/null 2>&1
if [ $?  -eq 0 ]; then
        connect $@
else
        connect -S proxy.cd.intel.com:1080 $@
fi

