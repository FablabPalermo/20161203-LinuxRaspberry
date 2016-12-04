#!/bin/bash

# blink a led with Bash
# workshop linux con raspberry pi
# fablab palermo 03/12/2016

# trap ctrl-c and call ctrl_c()
# prima di chiudere impostiamo il valore finale
# del GPIO e lo disattiviamo
trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
	echo 1 > /sys/class/gpio/gpio22/value
	echo 22 > /sys/class/gpio/unexport
	exit 0
}


# attiviamo il GPIO interessato
echo 22 > /sys/class/gpio/export

# diamo al sistema il tempo di svegliare il GPIO
sleep 1

# impostiamo direzione
echo out > /sys/class/gpio/gpio22/direction

# facciamo partire il ciclo per il blink
while :
do
 echo 0 > /sys/class/gpio/gpio22/value
 sleep 0.2
 echo 1 > /sys/class/gpio/gpio22/value
 sleep 0.2
done
