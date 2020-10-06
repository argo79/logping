
dir="$HOME/log/"

if [ ! -d $dir ] 	
then
    echo "Directory " $dir " DOES NOT exists." 
    echo "Quindi la creo..."
    echo $dir
    mkdir $dir
    exit 9999 # die with error code 9999
else 
	echo "Directory " $dir " EXISTS." 
fi
date >> $dir/ping.txt ; ping -c 3 www.google.it >> $dir/ping.txt
cat $dir/ping.txt | grep -E 'CEST|rtt|transmitted|Error' > $dir/logping.txt
echo "Tentativi (CEST): " >> $dir/logping.txt ; cat $dir/logping.txt | grep -c CEST >> $dir/logping.txt
echo "Riusciti (rtt): " >> $dir/logping.txt ; cat $dir/logping.txt | grep -c rtt >> $dir/logping.txt
