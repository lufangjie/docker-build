#!/bin/sh

jar=$1
type=$2

if [ ! $type ]; then
	echo "The second parameter should be  [docker] | [docker-dev] | [docker-pro]"
else
	if [[ -f "/usr/local/${jar}" ]]; then
		# exec  nohup java -jar /usr/local/${jar} --spring.profiles.active=${type} >/dev/null 2>log.log
		# echo "===== ${jar} lanuch succeed...... ====="
		exec  java -jar /usr/local/${jar} --spring.profiles.active=${type}
	else
		echo "/usr/local/${jar} is not exit"
	fi;
fi;


tail -f /dev/null