#!/bin/bash
date >> /var/log/ping.txt ; ping -c 3 www.google.it >> /var/log/ping.txt
cat /var/log/ping.txt | grep -E 'CEST|rtt|transmitted|Error' > /var/log/logping.txt
echo "Tentativi (CEST): " >> /var/log/logping.txt ; cat /var/log/logping.txt | grep -c CEST >> /var/log/logping.txt
echo "Riusciti (rtt): " >> /var/log/logping.txt ; cat /var/log/logping.txt | grep -c rtt >> /var/log/logping.txt
