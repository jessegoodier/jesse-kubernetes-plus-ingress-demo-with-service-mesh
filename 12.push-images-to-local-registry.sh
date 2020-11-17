#!/bin/bash -xe

# docker pull jgoodier/kic-plus-nap:1.9.0
docker pull kubernetesui/metrics-scraper:v1.0.4
docker pull kubernetesui/dashboard:v2.0.4
docker pull jgoodier/nginx-hello:latest
# docker tag jgoodier/kic-plus-nap:1.9.0 k8s.nginx.rocks:444/kic-plus-nap:1.9.0
docker tag kubernetesui/metrics-scraper:v1.0.4 k8s.nginx.rocks:444/metrics-scraper:v1.0.4
docker tag kubernetesui/dashboard:v2.0.4 k8s.nginx.rocks:444/dashboard:v2.0.4
docker tag jgoodier/nginx-hello:latest k8s.nginx.rocks:444/nginx-hello
# docker push k8s.nginx.rocks:444/kic-plus-nap:1.9.0 
docker push k8s.nginx.rocks:444/metrics-scraper:v1.0.4
docker push k8s.nginx.rocks:444/nginx-hello:latest 
docker push k8s.nginx.rocks:444/dashboard:v2.0.4
