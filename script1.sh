#Autor: Cristian manosalva codigo: 1628397
#Autor: Nilson cardona     codigo: 1623634

#!/bin/bash
 
numProcesos=$(ps ax | tail -n +2 | wc -l)
echo ${numProcesos}

porcMemoria=$(free | grep Mem | awk '{print $4/$2 * 100 "%"}')
echo ${porcMemoria}

porcDisco=$(df | grep /dev/sda5 | awk '{print $4/$2 *100 "%"}')
echo ${porcDisco}



curl --silent --request POST --header "X-THINGSPEAKAPIKEY: F42I09UR9MZ1MZNE" --data "field1=${numProcesos} & field2=${porcMemoria} & field3=${porcDisco}" http://api.thingspeak.com/update 
