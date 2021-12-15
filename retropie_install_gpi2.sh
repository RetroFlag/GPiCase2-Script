#!/bin/bash
filewebsite="https://raw.githubusercontent.com/RetroFlag/GPiCase2-Script/main"
sleep 2s
#Step 1) Check if root--------------------------------------
if [[ $EUID -ne 0 ]]; then
   echo "Please execute script as root." 
   exit 1
fi


#-----------------------------------------------------------

#Step 3) Update repository----------------------------------
#sudo apt-get update -y

#sleep 2s
#-----------------------------------------------------------

#Step 4) Install gpiozero module----------------------------
#sudo apt-get install -y python3-gpiozero

#sleep 2s
#-----------------------------------------------------------

#Step 5) Download Python script-----------------------------
cd /opt/
sudo mkdir RetroFlag
cd /opt/RetroFlag
script=SafeShutdown.py

if [ -e $script ];
	then
		wget --no-check-certificate -O  $script "$filewebsite""/retropie_SafeShutdown_gpi2.py"
	else
		wget --no-check-certificate -O  $script "$filewebsite""/retropie_SafeShutdown_gpi2.py"
fi
wget --no-check-certificate -O  "lcdfirst.sh" "$filewebsite""/retropielcdfirst.sh"
wget --no-check-certificate -O  "lcdnext.sh" "$filewebsite""/retropielcdnext.sh"
#wget --no-check-certificate -O  "LCD.sh" "$filewebsite""/LCD.sh"

#-----------------------------------------------------------
sleep 2s	
#Step 6) Enable Python script to run on start up------------
cd /etc/
RC=rc.local

if grep -q "sh \/opt\/RetroFlag\/lcdfirst.sh\& \nsleep 1\& \nsudo python \/opt\/RetroFlag\/SafeShutdown.py \&" "$RC";
	then
		echo "File /etc/rc.local already configured. Doing nothing."
	else
		sed -i -e "s/^exit 0/sh \/opt\/RetroFlag\/lcdfirst.sh\& \nsleep 1\& \nsudo python \/opt\/RetroFlag\/SafeShutdown.py\& \n&/g" "$RC"
		echo "File /etc/rc.local configured."
fi
#-----------------------------------------------------------

#Step 7) Reboot to apply changes----------------------------
echo "RetroFlag Pi Case installation done. Will now reboot after 3 seconds."
sleep 3s
sudo reboot
#-----------------------------------------------------------









