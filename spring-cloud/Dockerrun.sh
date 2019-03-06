#!/bin/sh

while read line
do
	module=`echo $line | awk -F '=' '{print $1}'`
	jar=`echo $line | awk -F '=' '{print $2}'`
	
	echo ${jar}
	PID=`ps -ef |grep $(echo ${jar} | awk -F/ "{print $NF}") | grep -v grep | awk "{print $2}"`
	if [ -n "$PID" ]; then
		echo "$module is running: PID = $PID"
	else
		exec nohup java -jar /usr/local/datacenter/${jar} >/dev/null 2>${module}.log &
		echo "$module started succeed."
	fi;
done < /usr/local/datacenter/config.ini

tail -f /dev/null
