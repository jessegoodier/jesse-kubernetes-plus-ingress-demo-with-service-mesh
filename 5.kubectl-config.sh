#!/bin/bash -ex
# configure kubectl for vagrant user
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# make sure kubectl works
running=0
until [ $running -gt 0 ]
do
  if kubectl cluster-info|grep -q running; then
    echo 'kube running'
    running=1;
  else
    echo 'waiting for cluster to be ready'
    sleep 2;
  fi
done
# this is a single node cluster, allow containers to run on it:
kubectl taint nodes --all node-role.kubernetes.io/master-

# who doesn't love command completion?
echo "alias k='kubectl'" >>$HOME/.bashrc
echo 'source <(kubectl completion bash)' >>$HOME/.bashrc
echo 'complete -F __start_kubectl k' >>$HOME/.bashrc
echo 'alias k=kubectl' >>$HOME/.zshrc
echo 'source <(kubectl completion zsh)' >>$HOME/.zshrc
echo 'complete -F __start_kubectl k' >>$HOME/.zshrc
sudo touch /etc/bash_completion.d/kubectl
sudo chmod ugo+w /etc/bash_completion.d/kubectl
kubectl completion bash >/etc/bash_completion.d/kubectl
sudo touch /etc/bash_completion.d/helm
sudo chmod ugo+w /etc/bash_completion.d/helm
helm completion bash >/etc/bash_completion.d/helm

alias k=kubectl