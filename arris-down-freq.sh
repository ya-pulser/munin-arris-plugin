#!/bin/bash
if [ "$1" == "config" ]
then 
	  echo "graph_title Arris 900s Channel freq"
	  echo "graph_vlabel MHz"
	  echo "graph_category arris"
	  echo "downfreq1.label Downstream 1"
	  echo "downfreq2.label Downstream 2"
	  echo "downfreq3.label Downstream 3"
	  echo "downfreq4.label Downstream 4"
	  echo "downfreq5.label Downstream 5"
	  echo "downfreq6.label Downstream 6"
	  echo "downfreq7.label Downstream 7"
	  echo "downfreq8.label Downstream 8"
	  exit 0;
fi

MODEM_URL=192.168.100.1/phy.htm

wget -q -O - $MODEM_URL | \
  grep 'TR><TD>Downstream' | \
  awk 'BEGIN{RS="R"} {print $0;}' | \
  grep 'MHz' | \
  sed 's/<\/TD><TD>/ /g;s/><TD>//g; s/<\/TD>//g; s/<T//g; s/Downstream /downfreq/' | \
  awk ' { print $1 ".value",$2; }' | \
  grep downfreq

