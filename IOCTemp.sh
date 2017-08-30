#!/bin/bash

# Most LSI/Broadcom HBAs have a "max safe operating temp" of 55C.
# The temperature value, however, is denoted in 'hex' number format.
# Run this script from within the unzipped LSIget directory to locate the hex value and convert to decimal.

format="%-15s %2s %8s %-1s %-12s\n"

IOCTempHex=`grep -r 'IOCTemperature' . | cut -f 21 -d " "`

printf "$format" "IOCTemperature" "=" "$IOCTempHex"

DECIMAL=`printf "%d\n" $IOCTempHex `

if test $DECIMAL -gt 54
then
  STATUS="(overheat)"
else
  STATUS="(OK)"
  fi

printf "$format" "HBA Temperature" "=" $DECIMAL "C" $STATUS
