#!/bin/bash

# Step 1) Check if root ####################################
if [[ $EUID -ne 0 ]]; then
   echo "Please execute script as root." 
   exit 1
fi
#-----------------------------------------------------------

SourcePath=https://gitee.com/clock333mhz/GPiCase2-Script/raw/cn_main

#-----------------------------------------------------------
sleep 2s

mount -o remount, rw /flash
mount -o remount, rw /

#Download Python script-----------------------------
mkdir /storage/.RetroFlag/
sleep 2s
script=/storage/.RetroFlag/SafeShutdown.py

wget -O  $script "$SourcePath/lakka_SafeShutdown_gpi2.py"
wget -O  "/storage/.RetroFlag/lcdfirst.sh" "$SourcePath/lakkalcdfirst.sh"
wget -O  "/storage/.RetroFlag/lcdnext.sh" "$SourcePath/lakkalcdnext.sh"
#-----------------------------------------------------------

sleep 2s
# DIR=/userdata/system/custom.sh
DIR=/storage/.config/autostart.sh

if grep -q "python $script &" "$DIR";
	then
		if [ -x "$DIR" ];
			then 
				echo "Executable script already configured. Doing nothing."
			else
				chmod +x $DIR
		fi
	else
		echo "python $script & sh /storage/.RetroFlag/lcdfirst.sh" >> $DIR
		chmod +x $DIR
		chmod +x /storage/.RetroFlag/lcdfirst.sh
		chmod +x /storage/.RetroFlag/lcdnext.sh
		echo "Executable script configured."
fi
#-----------------------------------------------------------

echo "RetroFlag Pi Case Switch installation done. Will now reboot after 3 seconds."
sleep 3
systemctl reboot
#-----------------------------------------------------------
