#!/bin/bash

# Raspberry Pi Linux Workshop
# Fablab Palermo 03/12/2016
# Bash script per spegnere la raspberry premendo un bottone

#Attiviamo il GPIO
gpio mode 1 input
gpio mode 1 up

# Creiamo una funziona per lo shutdown
function shutdown {
	sudo poweroff
}

# Now wait!
while :
  do
    if [ $(gpio read 1) = 1 ]; then
	echo "button pressed! system shutdown"
	shutdown
    else
	wait
    fi
  done
