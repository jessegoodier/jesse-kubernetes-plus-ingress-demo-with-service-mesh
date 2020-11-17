#!/bin/bash -ex
sh 2.docker-install.sh
sudo sh 3.apt-installs-kube.sh
sh 4.kubeadm.sh
sh 5.kubectl-config.sh
sh 6.cni-network.sh
sh 11.docker-registry.sh
sh 12.push-images-to-local-registry.sh
sh nginx-service-mesh/3.cp-nginx-meshctl.sh
sh nginx-service-mesh/4.load-images.sh k8s.nginx.rocks
sh nginx-service-mesh/5.deploy-mesh.sh k8s.nginx.rocks
sh 7.manifests-plus-ingress-install.sh
# sh 8.prometheus.sh
# sh 9.grafana.sh
sh 10.create-apps.sh