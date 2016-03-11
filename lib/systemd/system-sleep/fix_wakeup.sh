#!/bin/bash

case $1/$2 in
    pre/suspend)
        # Don't wake up immediately when suspending.
        for device in 'EHC1' 'EHC2' 'XHC'; do
            state=`cat /proc/acpi/wakeup | grep "\b$device\b" | awk '{print $3}' | tr -d '*'`
            if [[ "$state" == "enabled" ]]; then
                echo $device > /proc/acpi/wakeup
            fi
        done
        ;;
    post/hibernate)
        # Restore keyboard brightness level on hibernation.
        value=$(cat /var/lib/systemd/backlight/platform-asus-nb-wmi\:leds\:asus\:\:kbd_backlight)
        dbus-send --type=method_call --print-reply=literal --system       \
            --dest='org.freedesktop.UPower'                               \
            '/org/freedesktop/UPower/KbdBacklight'                        \
            'org.freedesktop.UPower.KbdBacklight.SetBrightness'           \
            "int32:${value}}"
        ;;
esac
