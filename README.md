# GPiCase2-Script
RetroFlag GPiCase 2 CM4 Safeshutdown with automatically switch LCD and HDMI display script

## Before install script：
**Make sure that GPiCase2 patch is installed.**  
If the patch file is not installed and Install the script first, you will lose “config.txt” file causes CM4 to fail to boot

## After install script：
1. safe shutdown:Directly turning off the power switch will trigger the script for safe shutdown.
2. If it is not turned on the charging base, it will be displayed on a 3-inch LCD;When the base is connected, it will be switched to HDMI output

### For RetroPie4.7.1:

1. Make sure internet connected.
2. Make sure keyboard connected.
3. Press F4 enter terminal.
4. In the terminal, type the one-line command below(Case sensitive):

wget -O - "https://raw.githubusercontent.com/RetroFlag/GPiCase2-Script/main/retropie_install_gpi2.sh" | sudo bash

--------------------
### For Recalbox7.1.1/8.0
1. Make sure internet connected.
2. Make sure keyboard connected.
3. Press F4 first. And then press ALT-F2 enter terminal.
4. User: root Password: recalboxroot
5. In the terminal, type the one-line command below(Case sensitive):

wget -O - "https://raw.githubusercontent.com/RetroFlag/GPiCase2-Script/main/recalbox_install_gpi2.sh" | bash


--------------------

### for batocera31:
1. Make sure internet connected.
2. Make sure keyboard connected.
3. Enter terminal. How to enter terminal: https://wiki.batocera.org/access_the_batocera_via_ssh
4. User: root Password: linux
5. In the terminal, type the one-line command below(Case sensitive):

wget -O - "https://raw.githubusercontent.com/RetroFlag/GPiCase2-Script/main/batocera_install_gpi2.sh" | bash

--------------------

Example for lakkatv:
https://github.com/marcelonovaes/lakka_nespi_power
