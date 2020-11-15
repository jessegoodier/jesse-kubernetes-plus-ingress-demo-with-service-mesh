#!/bin/bash -ex
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab
systemctl is-active --quiet kubelet || sudo kubeadm init --config kubeadm-cluster.config