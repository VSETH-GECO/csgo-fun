#!/bin/bash
if [[ $1 =~ ^[1-4]{1}$ ]]
then
	if ! screen -list | grep -q csFun$1; 
	then
		HOSTNAME=$(hostname)
		IP=$(hostname -I | awk '{print substr($1,1)   }')
		PORT=$(( 27014+$1 ))
		TVPORT=$(( 27114+$1 ))
		screen -d -m -S csFun$1 ~/csgofunserver/srcds_run -game csgo -console -usercon -tickrate 128 +exec pre +map fy_poolparty_v2 -port $PORT -tv_port $TVPORT +$1 +gslt$1
		echo Started PolyLAN Fun#$1 on $IP:$PORT/:$TVPORT
	else
		echo Screen csFun$1 already running.
	fi
else
	echo Use parameter between 1-4 plz!
fi