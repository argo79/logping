#!/bin/bash
date >> /home/argo/speedtest.txt ; speedtest-cli >> /home/argo/speedtest.txt
cat /home/argo/speedtest.txt | grep -E 'CEST|Download|Upload' > /home/argo/logspeed.txt
