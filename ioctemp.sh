#!/bin/bash

# Get LSI/Broadcom HBA temperature values from LSIget logs
# Print filename(s) for files containing HBA hex temperature values

formatFILESheader="\n %-50s \n\n"
printf "$formatFILESheader" "Files Containing HBA Temperature Data:"

formatFILES="%-50s\n"

aFILES=( `grep -rH --include=*.txt 'IOCTemperature:' | cut -f 1 -d ":"` )

for i in "${aFILES[@]}"
do
  printf "$formatFILES" "$i"
done | nl -s ". "

# Print HBA temperature values with status (overheat/OK)
# Create hex temperature array, print value for each HBA

formatHEXheader="\n %-50s \n\n"
printf "$formatHEXheader" "Hex Temperature Values:"

formatTEMP="%-15s %2s %8s %-1s %-12s\n"

aIOC_hex=( `grep -r 'IOCTemperature:' . | cut -f 21 -d " "` )

for i in "${aIOC_hex[@]}"
do
  printf "$formatTEMP" "IOCTemperature" "=" "$i"
done | nl -s ". "

# Create decimal temperature array, print value and status for each HBA

formatDECheader="\n %-50s \n\n"
printf "$formatDECheader" "Decimal Temperature Values & Status:"

aIOC_decimal=(
$(
for i in "${aIOC_hex[@]}"
do
  printf "%d\n" "$i"
done
)
)

for i in "${aIOC_decimal[@]}"
do
  if test $i -gt 54
  then 
    printf "$formatTEMP" "HBA Temperature" "=" "$i" "C" "(overheat)"
  else
    printf "$formatTEMP" "HBA Temperature" "=" "$i" "C" "(OK)"
  fi
done | nl -s ". "

printf "\n"
