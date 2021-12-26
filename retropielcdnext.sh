
HDMI_HPD=18

HDMI_HPD_VALUE=$(cat /sys/class/gpio/gpio$HDMI_HPD/value)
   
#echo "HDMI_HPD_VALUE2=""$HDMI_HPD_VALUE"
   
if  grep -q "enable_dpi_lcd=1" "/boot/config.txt" ; then
	ISLCDFILE="1"
else
	ISLCDFILE="0"		
fi
#echo "ISLCDFILE1=""$ISLCDFILE"

File=/usr/share/alsa/alsa.conf 

		if [ $HDMI_HPD_VALUE = "1" ]; then
			if [ $ISLCDFILE = "1" ]; then   
				#mount -o remount, rw /boot
				#mount -o remount, rw /	 
				if grep -q "defaults.ctl.card 1"  "$File";
				then
					sudo sed -i '/defaults.ctl.card 1/c defaults.ctl.card 0' $File
					sudo sed -i '/defaults.pcm.card 1/c defaults.pcm.card 0' $File
					echo "HDMI ADUIO  fix."
				else
					echo " defaults.ctl.card 0" >> $File
					echo "HDMI ADUIO enabled."
				fi
				sudo cp -f "/boot/config.txt" "/boot/config_lcd.txt"
				sudo rm -f /boot/config.txt
				sudo cp -f "/boot/config_hdmi.txt" "/boot/config.txt"
		  fi
		else
			if [ $ISLCDFILE = "0" ]; then  
				#mount -o remount, rw /boot
				#mount -o remount, rw /	 
				if grep -q "defaults.ctl.card 0"  "$File";
				then
					sudo sed -i '/defaults.ctl.card 0/c defaults.ctl.card 1' $File
					sudo sed -i '/defaults.pcm.card 0/c defaults.pcm.card 1' $File
					echo "USB ADUIO  fix."
				else
					echo " defaults.ctl.card 1" >> $File
					echo "USB ADUIO enabled."
				fi
			 	sudo rm -f /boot/config.txt
				sudo cp -f "/boot/config_lcd.txt" "/boot/config.txt"
		  fi
		fi
    
