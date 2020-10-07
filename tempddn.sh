#!/bin/bash
dir="$HOME/log"

temp1=$(<$dir/numeroCEST)
mosquitto_pub -h 192.168.2.11 -t "ddn/temp1" -m $temp1