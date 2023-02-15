@echo off

set Pan=.\
set OrgFolder=original_files\
set OverlaysFolder=overlays\
set ConfigFile=config.txt
set Dpi24File=dpi24.dtbo

if exist %Pan%%OrgFolder%%ConfigFile% (		
	echo config.txt is backuped
) else (
	copy .\..\config.txt .\original_files\config.txt
)

::if exist %Pan%%OrgFolder%%OverlaysFolder%%Dpi24File% (		
::	echo dpi24.dtbo is backuped
::) else (
::	copy .\..\overlays\dpi24.dtbo .\original_files\overlays\dpi24.dtbo
::)

copy .\patch_files\config.txt .\..\config.txt
copy .\patch_files\config_lcd.txt .\..\config_lcd.txt
copy .\patch_files\config_hdmi.txt .\..\config_hdmi.txt
::copy .\patch_files\overlays\dpi24.dtbo .\..\overlays\dpi24.dtbo
::copy .\patch_files\overlays\pwm-audio-pi-zero.dtbo .\..\overlays\pwm-audio-pi-zero.dtbo

echo .
echo -----------------------Successful configuration-----------------------
echo .


pause