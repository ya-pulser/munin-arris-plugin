#!/bin/bash
if [ "$1" == "config" ]
then 
	  echo "graph_title Arris 900s Signal to Noise (dB)"
	  echo "graph_vlabel db (decibels)"
	  echo "graph_category arris"
	  echo "downsnr1.label Downstream 1"
	  echo "downsnr2.label Downstream 2"
	  echo "downsnr3.label Downstream 3"
	  echo "downsnr4.label Downstream 4"
	  echo "downsnr5.label Downstream 5"
	  echo "downsnr6.label Downstream 6"
	  echo "downsnr7.label Downstream 7"
	  echo "downsnr8.label Downstream 8"
	  exit 0;
fi

MODEM_URL=192.168.100.1/phy.htm

wget -q -O - $MODEM_URL | \
  grep 'TR><TD>Downstream' | \
  awk 'BEGIN{RS="R"} {print $0;}' | \
  grep 'dB' | \
  sed 's/<\/TD><TD>/ /g;s/><TD>//g; s/<\/TD>//g; s/<T//g; s/Downstream /downsnr/' | \
  awk ' { print $1 ".value",$6; }' | \
  grep downsnr

