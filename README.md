munin-arris-plugin
==================

Munin plugin to monitor Arris 900s DOCSIS 3.0 cable modem

Inspired by:
  - [Using Munin to Monitor My Comcast Cable Modem](http://www.weeve.org/?p=340)
  - [Munin monitoring your SB6120 Comcast Cable Modem](http://blog.jeffreyforman.net/2011/01/08/munin-monitoring-your-sb6120-comcast-cable-modem/)
  - [How to write Munin plugins](http://munin-monitoring.org/wiki/HowToWritePlugins)

Introduction:
=============
  * Munin [http://munin-monitoring.org/](http://munin-monitoring.org/) - monitoring software
  * Arris 900s - cable modem using DOCSIS 3.0 technology
  * munin-arris-plugin - munin-plugin to monitor Internet connection using the Arris modem

Installation:
=============
You should have up and running installation of Munin.
Two options:
  - copy scripts to /etc/munin/plugins/
  - ln -S the scripts to the /etc/munin/plugins right from the git fetched repository

Restart munin-node (sudo /etc/init.d/munin-node restart).

Wait 10-20 minutes, observe results through /var/cache/munin/www folder or start Web Server there and go to html interface.

To start simplest web server:
```
cd /var/cache/munin/www
python -m SimpleHTTPServer
``` 
and go to [http://localhost:8000/](http://localhost:8000/).

Desctiption:
============
Munin consists of several parts:
  - Munin-node - a process that started once in 5 minutes and fetches output of munin-plugins, registered in /etc/munin/plugins. 
    Fetched values are stored in internal database in RRD format.
  - Munin-cron - a process that parses RRD data and builds HTML / PNG presentation of the data in to /var/cache/munin/www.
  - Scripts in /etc/munin/plugins has two modes of operation:
    * config - tells munin which parameters exist and which labels to use
    * normal mode - returns the current values of the parameters

Sample of munin-plugin output:
==============================
```shell
ya-pulser$ ./pu-snr.sh config
graph_title Arris 900s Signal to Noise (dB)
graph_vlabel db (decibels)
graph_category arris
downsnr1.label Downstream 1
downsnr2.label Downstream 2
downsnr3.label Downstream 3
```
```shell
ya-pulser$ ./pu-snr.sh 
downsnr1.value 37.60
downsnr2.value 36.40
downsnr3.value 36.60
```
