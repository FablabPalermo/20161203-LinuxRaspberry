#!/usr/bin/env python  

# Raspberry Pi Linux Workshop
# Fablab Palermo 03/12/2016
# Python script per spegnere la raspberry premendo un bottone

import RPi.GPIO as GPIO  
import time  
import os  
 
# Use the Broadcom SOC Pin numbers  
# Setup the Pin with Internal pullups enabled and PIN in reading mode.  
GPIO.setmode(GPIO.BCM)  
GPIO.setup(18, GPIO.IN, pull_up_down = GPIO.PUD_UP)  
 
# Our function on what to do when the button is pressed  
def Shutdown(channel):  
    os.system("sudo shutdown -h now")  
 
# Add our function to execute when the button pressed event happens  
GPIO.add_event_detect(18, GPIO.FALLING, callback = Shutdown, bouncetime = 2000)  
 
# Now wait!  
while 1:  
    time.sleep(1)  