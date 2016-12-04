#!/bin/bash

# workshop linux con raspberry pi
# fablab palermo 03/12/2016

# trap ctrl-c and call ctrl_c()
# prima di chiudere impostiamo il valore finale
# dei GPIO e disattiviamoli
trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
	echo 1 > /sys/class/gpio/gpio22/value
	echo 22 > /sys/class/gpio/unexport
	echo 5 > /sys/class/gpio/unexport
	exit 0
}


# attiviamo i GPIO interessati
echo 22 > /sys/class/gpio/export
sleep 1
echo 5 > /sys/class/gpio/export
sleep 1

# impostiamo direzione pin
echo out > /sys/class/gpio/gpio22/direction
echo in > /sys/class/gpio/gpio5/direction

# facciamo partire il ciclo per il blink
while :
  do
    if [ $(cat /sys/class/gpio/gpio5/value) = 1 ]; then
	echo 0 > /sys/class/gpio/gpio22/value
	sleep 0.2
    else
	echo 1 > /sys/class/gpio/gpio22/value
	sleep 0.2
    fi
  done
