#!/bin/bash

sudo apt-get update
sudo apt-get install docker.io -y 
sudo usermod -aG docker $USER
newgrp docker
sudo apt install fontconfig openjdk-21-jre -y
sudo apt-get install docker-compose-v2 -y
