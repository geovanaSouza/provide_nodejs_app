#!/bin/bash

#Verify Dependencies
if [ "$(dpkg-query -W apache2-utils)" = 0 ]; then
	echo "Requirements missing: apache2-utils (apt-get install apache2-utils)"
fi

#Verify Dependencies
if [ ! -f /usr/bin/gnuplot ]; then
        echo "Requirements missing: gnuplot (apt-get install gnuplot-x11)"
fi

image_result=${image_result:-benchmark.jpg}

#Verify parameters
if [ $# -ne 4 ]; then
	echo "$(tput setaf 1)Missing parameters!!$(tput sgr 0)"
	echo "$(tput setaf 3)Usage:$(tput sgr 0)  ./stress_test.sh <requests_number> <concorrency_number> <keep_alive(true|false)> <url>/"
	echo "$(tput setaf 3)Example:$(tput sgr 0) ./stress_test.sh 1000 50 true http://hl_world.192.168.33.10.xip.io/"
	exit 1
fi

if [ $1 -lt $2 ]; then
	echo "request number ($1) can not be greater than concorrency number ($2)"
	exit 1
fi

if [ $3 = "true" ]; then
	keep_alive="-k"	
fi

ab -n $1 -c $2 -k ${keep_alive} -g out.dat $4/

echo $image_result
gnuplot -e "image='$image_result'" -e "data_file='out.dat'" plot.p
