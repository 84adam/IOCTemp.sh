#!/bin/bash

# Run this script from within the LSIget directory containing the "Summary.txt"
# This script will convert the 'hex' value to a 'decimal' temperature value.
# If you don't encounter any 'Summary.txt' file; check the other HBA logs that are contained in LSI_Products subdirectory.

format="%-15s %2s %8s %-1s %-12s\n"

IOCTempHex=`cat Summary.txt | grep "IOCTemperature:" | cut -f 21 -d " "`

printf "$format" "IOCTemperature" "=" "$IOCTempHex"

DECIMAL=`printf "%d\n" $IOCTempHex `

if test $DECIMAL -gt 54
then
  STATUS="(overheat)"
else
  STATUS="(OK)"
  fi

printf "$format" "HBA Temperature" "=" $DECIMAL "C" $STATUS
