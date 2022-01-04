
HDMI_HPD=18
echo 18 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio18/direction

HDMI_HPD_VALUE=$(cat /sys/class/gpio/gpio18/value)
echo "HDMI_HPD_VALUE2=""$HDMI_HPD_VALUE"
   
if  grep -q "enable_dpi_lcd=1" "/flash/config.txt" ; then
	ISLCDFILE="1"
else
	ISLCDFILE="0"		
fi
echo "ISLCDFILE1=""$ISLCDFILE"
		if [ "1" = $HDMI_HPD_VALUE  ]; then
			if [ "1" = $ISLCDFILE ]; then    
				mount -o remount, rw /flash
				# mount -o remount, rw /	 
				# rm -f /flash/config_lcd.txt
				# \cp -f "/flash/config.txt" "/flasht/config_lcd.txt"
				# rm -f /flash/config.txt
				\cp -f "/flash/config_hdmi.txt" "/flash/config.txt"
		  fi
		else
			if [ "0" = $ISLCDFILE ]; then 
				mount -o remount, rw /flash
				# mount -o remount, rw /	 
				# rm -f /flash/config_hdmi.txt
				# \cp -f "/flash/config.txt" "/flash/config_hdmi.txt"
				# rm -f /flash/config.txt
				\cp -f "/flash/config_lcd.txt" "/flash/config.txt"
		  fi
		fi
    
