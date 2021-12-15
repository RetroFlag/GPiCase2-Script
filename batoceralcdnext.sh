
HDMI_HPD=18

HDMI_HPD_VALUE=$(cat /sys/class/gpio/gpio$HDMI_HPD/value)
   
echo "HDMI_HPD_VALUE2=""$HDMI_HPD_VALUE"
   
if  grep -q "enable_dpi_lcd=1" "/boot/config.txt" ; then
	ISLCDFILE="1"
else
	ISLCDFILE="0"		
fi
echo "ISLCDFILE1=""$ISLCDFILE"
		if [ "1" = $HDMI_HPD_VALUE  ]; then
			if [ "1" = $ISLCDFILE ]; then    
				mount -o remount, rw /boot
				mount -o remount, rw /	 
				rm -f /boot/config.txt
				cp -f "/boot/config_hdmi.txt" "/boot/config.txt"
		  fi
		else
			if [ "0" = $ISLCDFILE ]; then 
				mount -o remount, rw /boot
				mount -o remount, rw /	 
			 rm -f /boot/config.txt
				cp -f "/boot/config_lcd.txt" "/boot/config.txt"
		  fi
		fi
    
