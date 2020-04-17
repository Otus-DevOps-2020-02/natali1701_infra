#!/bin/bash

echo "***Dobavlyaem kluchi i repositoriy MongoDB***"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

echo "***Obnovlyzem index dostupnux paketov i stzvim MongoDB***"

sudo apt update
sudo apt install -y mongodb-org

echo "***Zapuskaem MongoDB***"
sudo systemctl start mongod

echo "***Dobavlyaem v avtozapusk MongoDB***"
sudo systemctl enable mongod

echo "***Proveryaem raboty MongoDB***"
sudo systemctl status mongod
