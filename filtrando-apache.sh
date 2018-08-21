#!/bin/bash

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
	echo "entrou"
	cat apache-log/apache.log | grep $1
else
	echo "IP inválido"	
fi

