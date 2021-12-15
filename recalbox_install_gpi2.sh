#!/bin/bash
#Step 1 make /boot writable---------------------------------
sleep 2s
filewebsite="https://raw.githubusercontent.com/RetroFlag/GPiCase2-Script/main"

mount -o remount, rw /boot
mount -o remount, rw /


File=/boot/recalbox-config.txt
if grep -q "dtparam=audio" "$File";
	then
		sed -i '/dtparam=audio/c #dtparam=audio=off' $File
		echo "ADUIO fix."
	else
		echo " #dtparam=audio=off" >> $File
		echo "ADUIO enabled."
fi


#Step 3) Download Python script-----------------------------
mkdir /opt/RetroFlag
sleep 2s

script=/opt/RetroFlag/SafeShutdown.py

if [ -e $script ];
	then
		wget --no-check-certificate -O  $script "$filewebsite""/recalbox_SafeShutdown_gpi2.py"
	else
		wget --no-check-certificate -O  $script "$filewebsite""/recalbox_SafeShutdown_gpi2.py"
fi
wget --no-check-certificate -O  "/opt/RetroFlag/lcdfirst.sh" "$filewebsite""/lcdfirst.sh"
wget --no-check-certificate -O  "/opt/RetroFlag/lcdnext.sh" "$filewebsite""/lcdnext.sh"
#wget --no-check-certificate -O  "/opt/RetroFlag/LCD.sh" "$filewebsite""/LCD.sh"

#-----------------------------------------------------------

sleep 2s

#Step 4) Enable Python script to run on start up------------
DIR=/etc/init.d/S99RetroFlag
#sed '1,40 d' /etc/init.d/S99RetroFlag
#		chmod +x /opt/RetroFlag/lcdfirst.sh
#		chmod +x /opt/RetroFlag/lcdnext.sh

if grep -q "python $script &" "$DIR";
	then
		if [ -x $DIR ];
			then 
				echo "Executable S99RetroFlag already configured. Doing nothing."
			else
				chmod +x $DIR
		fi
	else
		echo -e "python $script & \n sh /opt/RetroFlag/lcdfirst.sh \n" >> $DIR 
#		echo -e "python $script & \n/opt/RetroFlag/LCD.sh \n" >> $DIR 
#		echo "python $script &" >> $DIR
		chmod +x $DIR
#		chmod +x /opt/RetroFlag/LCD.sh
		chmod +x /opt/RetroFlag/lcdfirst.sh
		chmod +x /opt/RetroFlag/lcdnext.sh
		echo "Executable S99RetroFlag configured."
fi
#-----------------------------------------------------------

#Step 5) Reboot to apply changes----------------------------
echo "RetroFlag Pi Case Switch installation done. Will now reboot after 3 seconds."
sleep 3
reboot
#-----------------------------------------------------------
