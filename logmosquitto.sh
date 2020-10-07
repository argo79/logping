#!/bin/bash
dir="$HOME/log"

temp1=$(<$dir/numeroCEST)
temp2=$(<$dir/numeroRtt)
diff=$(($temp1-$temp2))
mosquitto_pub -h 192.168.2.11 -t "ddn/tries" -m $temp1
mosquitto_pub -h 192.168.2.11 -t "ddn/ok" -m $temp2
mosquitto_pub -h 192.168.2.11 -t "ddn/error" -m $diff