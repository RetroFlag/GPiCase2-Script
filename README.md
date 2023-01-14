# GPiCase2-Script
The RetroFlag GPiCase 2 CM4 safe shutdown script will automatically switch between the LCD display and HDMI output when using the dock.

## Before installing the script：
**Make sure that the GPiCase2 patch is installed.**  
If the patch file is not installed and you install the script first, you will lose the “config.txt” file, which will cause the CM4 to fail to boot.  
Click the link to download the patch：[Download GPiCase2 patch](https://github.com/RetroFlag/GPiCase2-Script/raw/main/GPi_Case2_patch.zip).
`Be careful!: This PATCH does not need to be installed in recalbox 8.1.1`

## After installing the script：
1. Safe shutdown: Directly turning off the power switch will trigger the script for safe shutdown.
2. If the device is not connected to the dock when it is powered on, the video signal will display on the 3-inch LCD. When the device is connected to the base when it is powered on, the video signal will switch to HDMI output.

### For RetroPie4.7.1:

1. Make sure you are connected to the internet.
2. Make sure your keyboard is connected.
3. Press F4 to enter the terminal.
4. In the terminal, type the command below (This is case sensitive):

`wget -O - "https://raw.githubusercontent.com/RetroFlag/GPiCase2-Script/main/retropie_install_gpi2.sh" | sudo bash`

--------------------
### For Recalbox7.1.1/8.0
`Be careful!: This script does not need to be installed in recalbox 8.1.1`
1. Make sure you are connected to the internet.
2. Make sure your keyboard is connected.
3. Press F4, and then press ALT-F2 to enter the terminal.
4. User: root Password: recalboxroot
5. In the terminal, type the command below (This is case sensitive):

`wget -O - "https://raw.githubusercontent.com/RetroFlag/GPiCase2-Script/main/recalbox_install_gpi2.sh" | bash`


--------------------

### for batocera31:
1. Make sure you are connected to the internet.
2. Make sure your keyboard is connected.
3. Enter terminal. For information on how to access the termina, visit this link: https://wiki.batocera.org/access_the_batocera_via_ssh
4. User: root Password: linux
5. In the terminal, type the command below (This is case sensitive):

`wget -O - "https://raw.githubusercontent.com/RetroFlag/GPiCase2-Script/main/batocera_install_gpi2.sh" | bash`

--------------------

Example for lakkatv:
https://github.com/marcelonovaes/lakka_nespi_power
