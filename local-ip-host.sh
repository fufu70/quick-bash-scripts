#!/bin/bash
# Script that routes a ip port to a local host name. Simply give the
#  1.) port number - default is 8080
#  2.) ip address - default is 127.0.0.1
#  3.) local ip route - default is 10.0.0.1
#  4.) local port route - default is 80
#  5.) Domain name 

echo -n "IP Address [127.0.0.1]: "

read IP_ROUTE

echo -n "Port Number [8080]: "

read PORT_NUMBER

echo -n "Local IP Address [10.0.0.1]: "

read LOCAL_IP_ROUTE

echo -n "Local Port for the local IP Address [80]: "

read LOCAL_PORT

echo -n "Host name for the local IP [test.page.dev]: "

read HOST_NAME

sudo ifconfig lo0 $LOCAL_IP_ROUTE alias
echo "rdr pass on lo0 inet proto tcp from any to $LOCAL_IP_ROUTE port $LOCAL_PORT -> $IP_ROUTE port $PORT_NUMBER" | sudo pfctl -ef -
sudo echo "$LOCAL_IP_ROUTE $HOST_NAME" >> /etc/hosts
sudo killall -HUP mDNSResponder


