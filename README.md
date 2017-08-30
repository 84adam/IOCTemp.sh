# ioctemp.sh

- Most LSI/Broadcom HBAs have a "max safe operating temp" of 55C.
- The 'on-chip' temperature value, however, is denoted in 'hex' number format.
- Run this script from within an unzipped LSIget log directory to locate/convert hex to decimal temperature values.

---

**Download & Unzip:**

- `wget https://github.com/84adam/ioctemp.sh/archive/master.zip ; unzip master.zip ; cd ioctemp.sh-master/`

**Move & Prepare to Run:**

- `chmod +x ioctemp.sh && cp ioctemp.sh $HOME/ioctemp.sh`
- `cp $HOME/ioctemp.sh /<path>/<to>/<LSIget-directory>/ioctemp.sh`
- `cd /<path>/<to>/<LSIget-directory>/`
- NOTE: You may also want to copy the script to a destination within your $PATH (and avoid having to prepend `./` to the command).

**Run: `./ioctemp.sh` from within an LSIget log directory.**

**Output Example:**

```
 Files Containing HBA Temperature Data:   
 
     1. <path>/<to>/<file-hba#>.txt
     2. <path>/<to>/<file-Summary>.txt
     3. <path>/<to>/<file-hba#>.txt
     4. <path>/<to>/<file-Summary>.txt
     5. <path>/<to>/<file-hba#>.txt
     6. <path>/<to>/<file-Summary>.txt
     7. <path>/<to>/<file-hba#>.txt
     8. <path>/<to>/<file-Summary>.txt

 Hex Temperature Values:                            

     1. IOCTemperature   =   0x003B               
     2. IOCTemperature   =   0x0039               
     3. IOCTemperature   =   0x0032               
     4. IOCTemperature   =   0x0037               

 Decimal Temperature Values & Status:               

     1. HBA Temperature  =       59 C (overheat)  
     2. HBA Temperature  =       57 C (overheat)  
     3. HBA Temperature  =       50 C (OK)        
     4. HBA Temperature  =       55 C (overheat)  
```
