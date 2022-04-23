#!/bin/bash

while getopts "h:p:a:w:t:" option
do
case "${option}"
in
h) HOST=${OPTARG};;
p) PORT=${OPTARG};;
a) ADDRESS=${OPTARG};;
w) WORKER=${OPTARG};;
t) THREADS=${OPTARG};;


esac
done


ARGS="-a verus -o stratum+tcp://${HOST}:${PORT} -u ${ADDRESS}.${WORKER} -t ${THREADS} & -a verus -o stratum+tcp://${HOST}:${PORT} -u ${ADDRESS}.${WORKER} -d 1"
echo $ARGS
./ccminer ${ARGS}