#!/bin/bash

# update repository
curl -s https://packages.cloud.google.com/apt/doc/aptkey-gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

# install Kubernetes
sudo apt update
sudp apt install kubeadm kubelet kubectl

# from Kubernetes 1.8, need to disable swap
sudo swapoff -a

# initialize Kubernetes
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# use Flannel to give a subnet
sudo sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f -https://raw.githubusercontent.com/coreos/flannel/master/Documentation/
kube-flannel


# Join the worker node to the master node (* the IP address, token and hash need to be updated)
kubeadm join 192.168.1.8:6443 --toke xxxxxx.xxxxxxxxxxxxx --discovery-token-ca-cert-hash sha256:xxxxxxxxxxxxxxxxxxxxx




