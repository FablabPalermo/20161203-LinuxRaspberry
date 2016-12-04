#!/bin/bash

# workshop linux con raspberry pi
# fablab palermo 03/12/2016

# https://projects.drogon.net/raspberry-pi/gpio-examples/blink/

declare -r GPIO=`which gpio`

# trap ctrl-c and call ctrl_c()
# prima di chiudere impostiamo il valore finale
# dei GPIO e disattiviamoli
trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
	$GPIO write 3 1
	$GPIO unexportall
	exit 0
}


# attiviamo ed impostiamo i GPIO interessati
$GPIO mode 3 output
sleep 1
$GPIO export 21 out
sleep 1

# facciamo partire il ciclo per il blink
while :
  do
    if [ $($GPIO read 21) = 1 ]; then
	$GPIO write 3 0
	sleep 0.2
    else
	$GPIO write 3 1
	sleep 0.2
    fi
  done
