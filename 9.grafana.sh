#!/bin/bash -ex
# sudo docker rm -f grafana
# sudo docker volume rm grafana-storage
#HOST_IP=$(/sbin/ifconfig ens160 | grep 'inet' | cut -d: -f2 | awk '{ print $2}')
HOST_IP=172.17.0.1
# create a persistent volume for your data in /var/lib/grafana (database and plugins)
sudo docker volume create grafana-storage

ID=$(id -u) # saves your user id in the ID variable
# starts grafana with your user id and using the data folder
sudo docker run -d --restart always --user $ID \
        --add-host k8s.nginx.rocks:$HOST_IP \
        --name grafana --publish 3000:3000 \
        --volume grafana-storage:/var/lib/grafana \
        --volume $PWD/grafana/:/etc/grafana \
        grafana/grafana

        