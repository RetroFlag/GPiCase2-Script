
HDMI_HPD=18 

echo $HDMI_HPD > /sys/class/gpio/export
#sleep 1  
echo in > /sys/class/gpio/gpio18/direction

HDMI_HPD_VALUE=$(cat /sys/class/gpio/gpio$HDMI_HPD/value)

echo "HDMI_HPD_VALUE1=""$HDMI_HPD_VALUE"

if  grep -q "enable_dpi_lcd=1" "/boot/config.txt" ; then
	ISLCDFILE="1"
else
	ISLCDFILE="0"		
fi
echo "ISLCDFILE=""$ISLCDFILE"


if [ "1" = $HDMI_HPD_VALUE  ]; then
	if [ "1" = $ISLCDFILE ]; then  
		#mount -o remount, rw /boot
		#mount -o remount, rw /	 
		
		sudo rm -f /boot/config_lcd.txt
		sudo cp -f "/boot/config.txt" "/boot/config_lcd.txt"
		sudo rm -f /boot/config.txt
		sudo cp -f "/boot/config_hdmi.txt" "/boot/config.txt"
		sudo shutdown -r now  
		sleep 10     
  fi
else
	if [ "0" = $ISLCDFILE ]; then 
		#mount -o remount, rw /boot
		#mount -o remount, rw /	 
		
		sudo rm -f /boot/config_hdmi.txt
		sudo cp -f "/boot/config.txt" "/boot/config_hdmi.txt"
		sudo rm -f /boot/config.txt
		sudo cp -f "/boot/config_lcd.txt" "/boot/config.txt"
		sudo shutdown -r now 
		sleep 10      
  fi
fi
   

