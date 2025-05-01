#!/bin/bash

# Range of local netwrok addresses for LAN
network="192.168.122."
# set up for loop to create a variable named host that uses brace expansion to equal numbers
# ranging 1 through 254
for host in {1..254}
do
# combine network LAN with hosts to get full IP
  ip=$network$host
# ping each host once and wait 2 seconds for a reply send results to a txt file
  ping -c 1 -w 2 $ip >> results.txt
# test exit code for succesful ping requests
if [ $? -eq 0 ]
    then
      # confirm reachable IP addresses
      echo "host $ip is reachable"
      # save live hosts in txt file
      echo "$ip" >> live_hosts.txt
    else
      echo "host $ip is unreachable"
fi
done
