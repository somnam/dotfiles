#!/bin/bash
set -e

function wifi_off { nmcli radio wifi off; } # Suspend wifi
function wifi_on  { nmcli radio wifi on; }  # Enable wifi

case $1/$2 in
    pre/suspend)
        # Don't wake up immediately when suspending.
        for device in 'EHC1' 'EHC2' 'XHC'; do
            state=`cat /proc/acpi/wakeup | grep "\b$device\b" | awk '{print $3}' | tr -d '*'`
            if [[ "$state" == "enabled" ]]; then
                echo $device > /proc/acpi/wakeup
            fi
        done

        wifi_off
        ;;
    pre/hibernate)
        wifi_off
        ;;
    post/suspend)
        wifi_on
        ;;
    post/hibernate)
        # Restore keyboard brightness level on hibernation.
        value=$(dbus-send --type=method_call --print-reply=literal --system         \
                    --dest='org.freedesktop.UPower'                                 \
                    '/org/freedesktop/UPower/KbdBacklight'                          \
                    'org.freedesktop.UPower.KbdBacklight.GetBrightness'             \
                    | awk '{print $2}')
        dbus-send --type=method_call --print-reply=literal --system       \
            --dest='org.freedesktop.UPower'                               \
            '/org/freedesktop/UPower/KbdBacklight'                        \
            'org.freedesktop.UPower.KbdBacklight.SetBrightness'           \
            "int32:${value}}"

        wifi_on
        ;;
esac

