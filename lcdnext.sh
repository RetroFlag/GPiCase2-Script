
HDMI_HPD=18

HDMI_HPD_VALUE=$(cat /sys/class/gpio/gpio$HDMI_HPD/value)
   
echo "HDMI_HPD_VALUE2=""$HDMI_HPD_VALUE"
   
if  grep -q "enable_dpi_lcd=1" "/boot/config.txt" ; then
	ISLCDFILE="1"
else
	ISLCDFILE="0"		
fi
echo "ISLCDFILE1=""$ISLCDFILE"
		if [ $HDMI_HPD_VALUE == "1" ]; then
			if [ $ISLCDFILE == "1" ]; then   
				mount -o remount, rw /boot
				mount -o remount, rw /	 
				rm -f /boot/config_lcd.txt
				cp -f "/boot/config.txt" "/boot/config_lcd.txt"
				rm -f /boot/config.txt
				cp -f "/boot/config_hdmi.txt" "/boot/config.txt"
		  fi
		else
			if [ $ISLCDFILE == "0" ]; then  
				mount -o remount, rw /boot
				mount -o remount, rw /	 
				rm -f /boot/config_hdmi.txt
				cp -f "/boot/config.txt" "/boot/config_hdmi.txt"
			 	rm -f /boot/config.txt
				cp -f "/boot/config_lcd.txt" "/boot/config.txt"
		  fi
		fi
    
