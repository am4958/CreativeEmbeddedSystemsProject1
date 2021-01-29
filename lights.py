



# Simple test for NeoPixels on Raspberry Pi
import time
import board
import neopixel
import json
import requests
from datetime import datetime, timedelta
pixels = neopixel.NeoPixel(board.D18,8)
num_pixels = 8
time.sleep(30)
ORDER = neopixel.RGB

####from neopixels site untill.....
def wheel(pos):
    # Input a value 0 to 255 to get a color value.
    # The colours are a transition r - g - b - back to r.
    if pos < 0 or pos > 255:
        r = g = b = 0
    elif pos < 85:
        r = int(pos * 3)
        g = int(255 - pos * 3)
        b = 0
    elif pos < 170:
        pos -= 85
        r = int(255 - pos * 3)
        g = 0
        b = int(pos * 3)
    else:
        pos -= 170
        r = 0
        g = int(pos * 3)
        b = int(255 - pos * 3)
    return (r, g, b) if ORDER in (neopixel.RGB, neopixel.GRB) else (r, g, b, 0)
 
 
def rainbow_cycle(wait):
    for j in range(255):
        for i in range(num_pixels):
            pixel_index = (i * 256 // num_pixels) + j
            pixels[i] = wheel(pixel_index & 255)
        pixels.show()
        time.sleep(wait)

####end from neo pixels site https://learn.adafruit.com/neopixels-on-raspberry-pi/python-usage

###found this method to help print json nicer on https://www.dataquest.io/blog/python-api-tutorial/ Great for testing code
#def jprint(obj):
#	text = json.dumps(obj, sort_keys=True, indent = 4) ####REMOVE LATER
#	print(text)
###ends here

def ledtimebb():
	response = requests.get("http://api.open-notify.org/iss-pass.json?lat=40.799&lon=-73.96&n=1")
	data = response.json()
	jprint(data) 				
	
	timestamp = data['response'][0]['risetime'] ##get rise time
	above = data['response'][0]['duration'] ## get duration
	
	utctime = datetime.utcfromtimestamp(timestamp) #get UTC time of risetime for ISS
	curtime = datetime.utcnow() #get current UTC time	
	countdown =  utctime - curtime #time until ISS is overhead
	seconds =  countdown.seconds #take number of seconds until iss overhead from timedelta
	

	
	minutes = seconds //60 #convert to minutes
	if minutes > 90:
		pixels.fill((255, 0, 0))
	elif 90 >= minutes > 60:
		pixels.fill((255,0,0))
	elif 60 >= minutes > 30:
		pixels.fill((255,0,127))	#pink
	elif 30 >= minutes > 15:
		pixels.fill((255,128,0))	#orange
	elif 15 >= minutes > 7:
		pixels.fill((255,255,0))	#yellow
	elif minutes == 7:
		pixels.fill((0,0,0))
		pixels[0] = (0, 255, 0)
	elif minutes == 6:
		pixels.fill((0,0,0))
		pixels[1] = (0, 255, 0)
	elif minutes == 5:
		pixels.fill((0,0,0))
		pixels[2] = (0, 255, 0)
	elif minutes == 4:
		pixels.fill((0,0,0))
		pixels[3] = (0, 255, 0)
	elif minutes == 3:
		pixels.fill((0,0,0))
		pixels[4] = (0, 255, 0)
	elif minutes == 2:
		pixels.fill((0,0,0))
		pixels[5] = (0, 255, 0)
	elif minutes == 1:
		pixels.fill((0,0,0))
		pixels[6] = (0, 255, 0)
	else:
		above = data['response'][0]['duration'] ##how long ISS is overhead
		end_above = time.time() + above  ##add that amount to the current time to get the endtime of the ISS overhead pass
		while time.time() < end_above:   
			pixels.fill((0,0,0))
			rainbow_cycle(0.00) #make rainbow while overhead

while True: 
	ledtimebb()
	time.sleep(60) 

