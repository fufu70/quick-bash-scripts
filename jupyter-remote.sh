#!/bin/bash
# Script that routes a remote jupyter notebook service over ssh to your localhost
#  1.) Host - The name of the host or the IP address
#  2.) Username - The username you're using to ssh into the host

cleanup() {
    echo -e "\n\nCLEANING UP JUPYTER REMOTELY!\n\n"
    rv=$?
    ssh $1@$2 'kill -9 $(cat pid.txt); rm jupyter.log pid.txt'
    ssh $1@$2 'python3 -m notebook stop 8889'
    echo -e "\n\nJUPYTER EXITED!\n\n"
    exit $rv
}

echo -n "HOST [192.39.192.2]: "

read HOST

echo -n "USERNAME [root]: "

read USERNAME

trap "cleanup $USERNAME $HOST" EXIT

OUT=$(ssh $USERNAME@$HOST 'nohup python3 -m notebook --no-browser --port=8889 --ip=0.0.0.0 --allow-root > jupyter.log & echo $!> pid.txt')
JUPYTER_OUTPUT=$(ssh $USERNAME@$HOST 'python3 -m notebook list')
URL=$(echo $JUPYTER_OUTPUT | sed 's/Currently running servers: //g' | sed 's/ ::.*//g')
ssh -fNT -L 8889:localhost:8889 $USERNAME@$HOST

echo -e "\n\n\tJupyter notebook runnig remotely from $HOST"
echo -e "\t\tOpen at: $URL"

open -a Safari $URL

while "$@"; do 
    sleep 5
done
