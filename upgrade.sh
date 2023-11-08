#!/bin/bash
# Upgrade K8S
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-mark unhold kubelet kubeadm kubectl
sudo apt-cache madison kubeadm
sudo apt install kubeadm=1.28.3-1.1 -y
sudo kubeadm upgrade plan
sudo kubeadm upgrade apply

sudo apt-cache madison kubelet
sudo apt install kubelet=1.28.3-1.1 -y
sudo kubeadm upgrade plan
sudo kubeadm upgrade apply

sudo apt-cache madison kubectl
sudo apt install kubectl=1.28.3-1.1 -y
sudo kubeadm upgrade plan
sudo kubeadm upgrade apply

sudo systemctl daemon-reload
sudo systemctl restart kubelet
sudo apt-mark hold kubelet kubeadm kubectl


# Node worker1
# Execute in plane
kubectl drain worker1 --ignore-daemonsets
kubectl get no
kubectl get po -A -o wide

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-mark unhold kubelet kubeadm kubectl
sudo apt install kubeadm=1.28.3-1.1 -y
sudo apt install kubelet=1.28.3-1.1 -y
sudo apt install kubectl=1.28.3-1.1 -y
sudo systemctl daemon-reload
sudo systemctl restart kubelet
sudo apt-mark hold kubelet kubeadm kubectl
# Execute in plane
kubectl uncordon worker1

# Node worker1
# Execute in plane
kubectl drain worker2 --ignore-daemonsets --delete-emptydir-data
kubectl get no
kubectl get po -A -o wide

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-mark unhold kubelet kubeadm kubectl
sudo apt install kubeadm=1.28.3-1.1 -y
sudo apt install kubelet=1.28.3-1.1 -y
sudo apt install kubectl=1.28.3-1.1 -y
sudo systemctl daemon-reload
sudo systemctl restart kubelet
sudo apt-mark hold kubelet kubeadm kubectl
# Execute in plane
kubectl uncordon worker2