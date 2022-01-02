@echo off

set Pan=.\
set UpFolder=..\
set OrgFolder=original_files\
set OverlaysFolder=overlays\
set ConfigFile=config.txt
set Dpi24File=dpi24.dtbo
set PwmAudiFile=pwm-audio-pi-zero.dtbo

if exist %Pan%%OrgFolder%%ConfigFile% (		
	copy .\original_files\config.txt .\..\config.txt
) else (
	echo .\original_files\config.txt is not exist
)

::if exist %Pan%%OrgFolder%%OverlaysFolder%%Dpi24File% (		
::	copy  .\original_files\overlays\dpi24.dtbo .\..\overlays\dpi24.dtbo
::	echo .
::	echo -----------------------Successful configuration-----------------------
::	echo .
::) else (
::	echo .\original_files\overlays\dpi24.dtbo is not exist
::)

::if exist %Pan%%UpFolder%%OverlaysFolder%%PwmAudiFile% (		
::	del .\..\overlays\pwm-audio-pi-zero.dtbo
::) 
if exist %Pan%%UpFolder%%ConfigHDMIFile% (		
	del .\..\config_hdmi.txt
	del .\..\config_lcd.txt
) 
	echo .
	echo -----------------------Successful configuration-----------------------
	echo .

pause