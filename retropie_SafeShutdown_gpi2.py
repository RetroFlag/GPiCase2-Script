import RPi.GPIO as GPIO
import os
import time
from multiprocessing import Process

#initialize pins
powerPin = 26 #pin 5
#ledPin = 14 #TXD
#resetPin = 2 #pin 13
powerenPin = 27 #pin 5

#initialize GPIO settings
def init():
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(powerPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
	#GPIO.setup(resetPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
	#GPIO.setup(ledPin, GPIO.OUT)
	#GPIO.output(ledPin, GPIO.HIGH)
	GPIO.setup(powerenPin, GPIO.OUT)
	GPIO.output(powerenPin, GPIO.HIGH)
	GPIO.setwarnings(False)

#waits for user to hold button up to 1 second before issuing poweroff command
def poweroff():
	while True:
		#self.assertEqual(GPIO.input(powerPin), GPIO.LOW)
		GPIO.wait_for_edge(powerPin, GPIO.FALLING)
		os.system("sudo killall emulationstation")
		os.system("sudo killall emulationstatio") #RetroPie 4.6
		os.system("sudo sleep 5s")
		os.system("sudo shutdown -h now")
def lcdrun():
	while True:
		os.system("sh /opt/RetroFlag/lcdnext.sh")
		time.sleep(1)



if __name__ == "__main__":
	#initialize GPIO settings
	init()
	#create a multiprocessing.Process instance for each function to enable parallelism 
	powerProcess = Process(target = poweroff)
	powerProcess.start()
	lcdrunProcess = Process(target = lcdrun)
	lcdrunProcess.start()

	powerProcess.join()
	lcdrunProcess.join()

	GPIO.cleanup()
