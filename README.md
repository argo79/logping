Per connessioni instabili o con frequenti interruzioni è possibile schedulare questo script.

Crea un log (logping.txt totale e logping.log sintesi) con i risultati di tre ping a google.

logfile.txt => data e risultati 3 ping

logfile.log => data interruzioni e numero tentativi/riusciti/differenza

esempio:

$ cat $HOME/log/logping.log

    File log di logping.sh *

    Interruzioni -

ven 2 ott 2020, 16.00.01, CEST STOP ven 2 ott 2020, 16.05.01, CEST STOP ven 2 ott 2020, 16.10.01, CEST STOP ven 2 ott 2020, 16.15.01, CEST STOP ven 2 ott 2020, 16.20.01, CEST STOP

    Totali - Tentativi (CEST): 1679 Riusciti (rtt): 1616 Differenza: 63

$

Da schedulare con crontab.

Il file log si legge con cat $HOME/log/logping.log
