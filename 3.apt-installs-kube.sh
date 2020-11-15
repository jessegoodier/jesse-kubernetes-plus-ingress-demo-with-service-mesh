#!/bin/bash -ex
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
CRIO_VERSION=1.19
apt-get update

OS=xUbuntu_18.04
VERSION=1.19


curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list

curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key | apt-key add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | apt-key add -
curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key | apt-key add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | apt-key add -

apt-get update
apt-get install -y helm cri-o cri-o-runc bash-completion jq  apt-transport-https ca-certificates curl gnupg2
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

# make sure subnet is correct for flannel and allow host network bridge
# sed -i 's/85/244/g' /etc/cni/net.d/100-crio-bridge.conf #don't need this if you install kubeadm after crio
# cat > /etc/sysctl.d/20-bridge-nf.conf <<EOF
# net.bridge.bridge-nf-call-iptables = 1
# EOF
# sysctl --system
