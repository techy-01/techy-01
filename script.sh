#!/bin/bash
 
for i in `cat apache_log.log | cut -d ' ' -f 1 | sort | uniq`;
do
       GET=`cat apache_log.log | grep $i | grep GET | wc -l`
       POST=`cat apache_log.log | grep $i | grep POST | wc -l`
       PUT=`cat apache_log.log | grep $i | grep PUT | wc -l`
       DELETE=`cat apache_log.log | grep $i | grep DELETE | wc -l`
       #echo $POST
	#echo $i
 echo "$i: GET=$GET, POST=$POST, PUT=$PUT, DELETE=$DELETE"
done
