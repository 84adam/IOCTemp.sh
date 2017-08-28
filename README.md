# IOCTemp.sh

- Most LSI/Broadcom HBAs have a "max safe operating temp" of 55C; the temperature value, however, is denoted in 'hex' number format.
- Run IOCTemp.sh where you have an LSIget (unzipped archive) directory containing the "Summary.txt" file.
- This script will convert the 'hex' value to a 'decimal' temperature value.

**TIP**: If you place a copy within your $PATH, you can call the script from anywhere. (Check with: `echo $PATH`)

**TROUBLESHOOTING**: If you don't encounter any 'Summary.txt' file; check the other HBA logs that are contained in the LSI_Products subdirectory. Search (or `grep`) for "IOCTemperature:" to identify the file containing this information.

---

**Run: `./IOCTemp.sh`**

Or, while this script exists in your $PATH, do: `IOCTemp.sh`

NOTE: The `$STATUS` variable/value is hardcoded; if greater than 54C, this returns "overheat". Othewise, (if 54C or less) this returns "OK" for status.

**Output Example #1:**

```
IOCTemperature   =   0x0032               
HBA Temperature  =       50 C (OK)  
```

**Output Example #2:**

```
IOCTemperature   =   0x0037               
HBA Temperature  =       55 C (overheat)
```
