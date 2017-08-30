# ioctemp.sh

- Most LSI/Broadcom HBAs have a "max safe operating temp" of 55C.
- The 'on-chip' temperature value, however, is denoted in 'hex' number format.
- Run this script from within an unzipped LSIget log directory to locate the hex value and convert to decimal.

---

**Run: `./ioctemp.sh ./`** (from within an LSIget log directory, this greps recursively through sub-folders for you.)

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
