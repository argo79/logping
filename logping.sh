#!/bin/bash
date >> /home/argo/ping.txt ; ping -c 3 www.google.it >> /home/argo/ping.txt
cat /home/argo/ping.txt | grep -E 'CEST|rtt|transmitted|Error' > /home/argo/logping.txt
echo "Tentativi (CEST): " >> /home/argo/logping.txt ; cat /home/argo/logping.txt | grep -c CEST >> /home/argo/logping.txt
echo "Riusciti (rtt): " >> /home/argo/logping.txt ; cat /home/argo/logping.txt | grep -c rtt >> /home/argo/logping.txt

