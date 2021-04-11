
#Mindfulness Moment


The Idea: This installation is aims to provide a moment of mindfulness for anyone who happens to see it. Using the Open Notify API, it tracks the overhead flight patterns of the International Space Station and lights up an LED ring of 8 Neopixels in accordance with its position relative to your location. Additionally, the mindfulness-centered Processing script starts full screen on boot to be displayed in a window alongside the LEDs as they countdown until the next time the ISS is overhead!

Hardware Used:
  -RaspberryPi 3B+ with Raspbian
  -Neopixel 8 LED light ring + wires
  -Monitor
  -Wireless keyboard+ mouse

Wiring: (from the input side of the Neopixel ring to the corresponding RaspberryPi GPIO pins)
  -Connect the light ring’s G to GND on the RaspberrryPi
  -Connect the LEDs V to the Pi’s 5v
  -Connect the LEDs S pin to GPIO18 on the RasperryPi 


How To:

1. Connect the Neopixel to the RaspberryPi by wiring it as stated above.

2. In your Python script call the Open Notify API located at http://api.open-notify.org/iss-pass.json?lat=<YOUR LATTITUDE>&lon=<YOUR LONGITUDE>. You can find your current lattitude and longitude by dropping a pin of your location on Google Maps.

3. To start this file on boot you will need to add a line to /etc/rc.local as follows: sudo python3 <full path to your file>. Note: When running on boot it takes time for the RaspberryPi to connect to wifi before it will be able to call the API. Unless settings are reconfigured, using the script above alone will not allow the program to run on boot as it will attempt to call the API prior to being connected to the internet. This will fail and the program will not run! To hack around this be sure to include a brief sleep() at the start of the program so that the RaspberryPi can connect to wifi before making the Api call. 

4. The Processing visual can be displayed on boot by adding usr/local/bin/processing-java —-sketch=/home/pi/<your file extension> —-run to the autostart file located at /etc/xdg/lxsession/LXDE-pi. 

5. Connect your RaspberryPi to your monitor and start it up! You should be good to go from there. 
