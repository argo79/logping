#!/bin/bash
cat /home/argo/log/logping.txt | grep -c CEST > /home/argo/log/numero.txt > numero
# cat /home/argo/log/numero.txt > numero
NUM=$(<numero)
echo $NUM
