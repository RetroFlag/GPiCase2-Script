
HDMI_HPD=18 

echo $HDMI_HPD > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio18/direction

HDMI_HPD_VALUE=$(cat /sys/class/gpio/gpio$HDMI_HPD/value)

echo "HDMI_HPD_VALUE1=""$HDMI_HPD_VALUE"

if  grep -q "enable_dpi_lcd=1" "/flash/config.txt" ; then
	ISLCDFILE="1"
else
	ISLCDFILE="0"		
fi
  
echo "ISLCDFILE=""$ISLCDFILE"
if [ "1" = $HDMI_HPD_VALUE  ]; then
	if [ "1" = $ISLCDFILE ]; then  
		mount -o remount, rw /flash
		# mount -o remount, rw /	 
		# rm -f /flash/config_lcd.txt
		# \cp -f "/flash/config.txt" "/flash/config_lcd.txt"
		# rm -f /flash/config.txt
		\cp -f "/flash/config_hdmi.txt" "/flash/config.txt"
		systemctl reboot
		sleep 10     
  fi
else
	if [ "0" = $ISLCDFILE ]; then 
		mount -o remount, rw /flash
		# mount -o remount, rw /	 
		# rm -f /flash/config_hdmi.txt
		# \cp -f "flash/config.txt" "/boot/config_hdmi.txt"
		# rm -f /flash/config.txt
		\cp -f "/flash/config_lcd.txt" "/flash/config.txt"
		systemctl reboot
		sleep 10      
  fi
fi
   