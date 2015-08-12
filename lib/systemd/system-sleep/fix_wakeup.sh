#!/bin/bash

case $1/$2 in
    pre/*)
        for device in 'EHC1' 'EHC2' 'XHC'; do
            state=`cat /proc/acpi/wakeup | grep "\b$device\b" | awk '{print $3}' | tr -d '*'`
            if [[ "$state" == "enabled" ]]; then
                echo $device > /proc/acpi/wakeup
            fi
        done
        ;;
    post/*)
        ;;
esac
