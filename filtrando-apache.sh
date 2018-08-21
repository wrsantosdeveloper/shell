#!/bin/bash

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
	cat ~/Projetos/Scripts/logs/apache-log/apache.log | grep $1
	
	if [ $? -ne 0 ]
	then
		echo "Ip não encontrado no arquivo de log. "
	fi

else
	echo "IP inválido"	
fi
