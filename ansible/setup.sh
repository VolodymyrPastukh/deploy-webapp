#!/bin/bash
path_key='~/.ssh/Kursova.pem'
cd ../terraform
public_ip=`terraform output -json public_ip | jq -r '.[0]'`

cd ../ansible/
sed -i "s/IP_ADDRESS/$public_ip/" hosts
sed -i "s|PATH_KEY|$path_key|" hosts

cd vars
sed -i "s/SERVICE_ADDRESS/$public_ip/" main.yaml
