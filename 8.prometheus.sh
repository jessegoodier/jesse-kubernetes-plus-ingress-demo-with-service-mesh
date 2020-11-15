#!/bin/bash -ex
#sudo docker rm -f prometheus
#HOST_IP=$(/sbin/ifconfig ens160 | grep 'inet' | cut -d: -f2 | awk '{ print $2}')
HOST_IP=172.17.0.1
sudo docker volume create prometheus_data
sudo docker run -d --name prometheus --restart always \
    --add-host k8s.nginx.rocks:$HOST_IP \
    --publish 9090:9090 \
    --volume prometheus_data:/prometheus \
    --volume $PWD/prometheus/:/etc/prometheus \
    prom/prometheus
