# SPDX-License-Identifier: BSD-3-Clause
#!/bin/sh
case $1/$2 in
  post/*)
    # Re-trigger ACPI device probe for the ELAN digitizer after lid open
    echo 1 > /sys/bus/i2c/devices/i2c-ELAN0001:00/power/control 2>/dev/null
    modprobe -r i2c_hid_acpi i2c_hid 2>/dev/null
    sleep 0.2
    modprobe i2c_hid_acpi
    modprobe i2c_hid
    ;;
esac

#For debugging purposes change "/dev/null" to desired log directory path
