#!/bin/bash

SourcePath=https://raw.githubusercontent.com/lyat97/G2script/main

#-----------------------------------------------------------
sleep 2s

mount -o remount, rw /boot
mount -o remount, rw /

#Download Python script-----------------------------
mkdir /userdata/RetroFlag
sleep 2s
script=/userdata/RetroFlag/SafeShutdown.py

wget -O  $script "$SourcePath/batocera_SafeShutdown_gpi2.py"
wget -O  "/userdata/RetroFlag/lcdfirst.sh" "$SourcePath/batoceralcdfirst.sh"
wget -O  "/userdata/RetroFlag/lcdnext.sh" "$SourcePath/batoceralcdnext.sh"
#-----------------------------------------------------------

sleep 2s
DIR=/userdata/system/custom.sh

if grep -q "python $script &" "$DIR";
	then
		if [ -x "$DIR" ];
			then 
				echo "Executable script already configured. Doing nothing."
			else
				chmod +x $DIR
		fi
	else
		echo "python $script & sh /userdata/RetroFlag/lcdfirst.sh" >> $DIR
		chmod +x $DIR
		chmod +x /userdata/RetroFlag/lcdfirst.sh
		chmod +x /userdata/RetroFlag/lcdnext.sh
		echo "Executable script configured."
fi
#-----------------------------------------------------------

echo "RetroFlag Pi Case Switch installation done. Will now reboot after 3 seconds."
sleep 3
shutdown -r now
#-----------------------------------------------------------
