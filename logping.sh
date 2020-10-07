#!/bin/bash

# Visualizza i numeri di CEST e di rtt
# cat logping.txt |grep -A 1 : |grep -v :
# Visualizza SOLO i ping persi
# cat ping.txt |grep -zPo '.*CEST\nSTOP\n'

dir="$HOME/log"
if [ ! -d $dir ] 	
then
    echo "Directory " $dir " DOES NOT exists." 
    echo "Quindi la creo..."
    echo $dir
    mkdir $dir
    # exit 9999 # die with error code 9999
else 
	echo "Directory " $dir " EXISTS." 
fi
date >> $dir/ping.txt ; ping -c 3 www.google.it >> $dir/ping.txt
echo "STOP" >> $dir/ping.txt
cat $dir/ping.txt | grep -E 'CEST|rtt|transmitted|Error' > $dir/logping.txt

cat $dir/logping.txt | grep -c CEST > numeroCEST 
cat $dir/logping.txt | grep -c rtt > numeroRtt

NumCEST=$(<numeroCEST)
NumRtt=$(<numeroRtt)
Diff=$(($NumCEST-$NumRtt))

echo -e "\e[1m\e[93mTentativi (CEST): \e[0m" >> $dir/logping.txt ; echo -e "    "$NumCEST >> $dir/logping.txt
echo -e "\e[1m\e[92mRiusciti (rtt)\e[0m: " >> $dir/logping.txt ; echo -e "    "$NumRtt >> $dir/logping.txt

if [ $Diff -gt 0 ]; then 
	echo "È maggiore di 0"
	echo "Ci sono state "$Diff" interruzioni..."
	echo -e "\e[1m\e[31mInterruzioni: " >> $dir/logping.txt ; echo -e "    \e[5m"$Diff"\e[25m\e[0m" >> $dir/logping.txt
else
	echo "È uguale a 0"
	echo -e "\e[1m\e[31mInterruzioni: " >> $dir/logping.txt ; echo -e "    "$Diff"\e[0m" >> $dir/logping.txt
fi
# echo "Tentativi (CEST): " >> $dir/logping.txt ; cat $dir/logping.txt | grep -c CEST >> $dir/logping.txt
# echo "Riusciti (rtt): " >> $dir/logping.txt ; cat $dir/logping.txt | grep -c rtt >> $dir/logping.txt

echo -e "**************************" > $dir/logping.log
echo -e "* \e[1m\e[32mFile log di logping.sh\e[0m *" >> $dir/logping.log
echo -e "**************************" >> $dir/logping.log
echo -e "\e[1m\e[31m- Interruzioni -\e[0m\e[91m\e[5m" >> $dir/logping.log
# echo "" >> $dir/logping.log
cat $dir/ping.txt | grep -zPo '.*CEST\nSTOP\n' >> $dir/logping.log
echo -e "\e[0m" >> $dir/logping.log
echo -e "\e[1m\e[95m- Ultimo tentativo -\e[0m\e[96m" >> $dir/logping.log
cat $dir/logping.txt |grep  -zPo '.*CEST\n.*\nrtt.*\n' > $dir/lastping.log
tail -n 4 $dir/lastping.log >> $dir/logping.log
echo -e "\e[0m" >> $dir/logping.log
# echo "" >> $dir/logping.log
echo -e "\e[1m\e[32m- Totali -\e[0m" >> $dir/logping.log
cat $dir/logping.txt | grep -A1 -E 'Tentativi|Riusciti|Interruzioni' >> $dir/logping.log

echo -e "" >> $dir/logping.log
echo -e "\e[1m\e[95m- Ultimo speedtest: -\e[0m" >> $dir/logping.log
tail -n 3 $dir/logspeed.log >> $dir/logping.log

echo -e "**************************" >> $dir/logping.log
# cat $dir/logping.txt |grep -A 1 : |grep -v : >> $dir/logping.log