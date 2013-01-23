#!/bin/bash
if [ "$1" == "config" ]
then 
	  echo "graph_title Arris 900s Signal level"
	  echo "graph_vlabel dBmV"
	  echo "graph_category arris"
	  echo "downvolt1.label Downstream 1"
	  echo "downvolt2.label Downstream 2"
	  echo "downvolt3.label Downstream 3"
	  echo "downvolt4.label Downstream 4"
	  echo "downvolt5.label Downstream 5"
	  echo "downvolt6.label Downstream 6"
	  echo "downvolt7.label Downstream 7"
	  echo "downvolt8.label Downstream 8"
	  exit 0;
fi

MODEM_URL=192.168.100.1/phy.htm

wget -q -O - $MODEM_URL | \
  grep 'TR><TD>Downstream' | \
  awk 'BEGIN{RS="R"} {print $0;}' | \
  grep 'MHz' | \
  sed 's/<\/TD><TD>/ /g;s/><TD>//g; s/<\/TD>//g; s/<T//g; s/Downstream /downvolt/' | \
  awk ' { print $1 ".value",$4; }' | \
  grep downvolt

