#!/bin/bash -xe

# sudo docker pull jgoodier/kic-plus-nap:1.9.0
# sudo docker tag jgoodier/kic-plus-nap:1.9.0 k8s.nginx.rocks:444/kic-plus-nap:1.9.0
# sudo docker push k8s.nginx.rocks:444/kic-plus-nap:1.9.0 

sudo docker pull kubernetesui/metrics-scraper:v1.0.4
sudo docker tag kubernetesui/metrics-scraper:v1.0.4 k8s.nginx.rocks:444/metrics-scraper:v1.0.4
sudo docker push k8s.nginx.rocks:444/metrics-scraper:v1.0.4

sudo docker pull kubernetesui/dashboard:v2.0.4
sudo docker tag kubernetesui/dashboard:v2.0.4 k8s.nginx.rocks:444/dashboard:v2.0.4
sudo docker push k8s.nginx.rocks:444/dashboard:v2.0.4

sudo docker pull jgoodier/nginx-hello:latest
sudo docker tag jgoodier/nginx-hello:latest k8s.nginx.rocks:444/nginx-hello
sudo docker push k8s.nginx.rocks:444/nginx-hello:latest

