#!/bin/bash -ex
sudo mkdir -p /etc/docker
sudo cp daemon.json  /etc/docker/daemon.json 
curl -fsSL https://get.docker.com -o get-docker.sh
systemctl is-active --quiet docker || sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo echo "$USER added to docker"
