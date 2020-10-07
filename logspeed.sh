#!/bin/bash

dir="$HOME/log"
date >> $dir/speedtest.txt ; speedtest-cli >> $dir/speedtest.txt
cat $dir/speedtest.txt | grep -E 'CEST|Download|Upload' > $dir/logspeed.txt