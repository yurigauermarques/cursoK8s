# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE_NAME = "ubuntu/jammy64"

Vagrant.configure("2") do |config|
    config.vm.boot_timeout = 600
    config.vm.define "k8s-plane01" do |plane|
        plane.vm.box = IMAGE_NAME
        plane.vm.network "private_network", ip: "172.16.1.100"
        plane.vm.network "public_network"
        plane.vm.provider "virtualbox" do |vb|
            vb.name = "Plane"
            vb.cpus = 4
            vb.memory = 4096
            vb.customize ["modifyvm", :id, "--groups", "/K8S"]
        end
        plane.vm.provision "shell", path: "plane.sh"        
    end

    config.vm.define "k8s-worker-1" do |worker1|
        worker1.vm.box = IMAGE_NAME
        worker1.vm.network "private_network", ip: "172.16.1.101"
        worker1.vm.network "public_network"
        worker1.vm.provider "virtualbox" do |vb|
            vb.name = "Worker-1"
            vb.cpus = 2
            vb.memory = 2048
            vb.customize ["modifyvm", :id, "--groups", "/K8S"]
        end
        worker1.vm.provision "shell", path: "worker1.sh"        
    end

    config.vm.define "k8s-worker-2" do |worker2|
        worker2.vm.box = IMAGE_NAME
        worker2.vm.network "private_network", ip: "172.16.1.102"
        worker2.vm.network "public_network"
        worker2.vm.provider "virtualbox" do |vb|
            vb.name = "Worker-2"
            vb.cpus = 2
            vb.memory = 2048
            vb.customize ["modifyvm", :id, "--groups", "/K8S"]
        end
        worker2.vm.provision "shell", path: "worker2.sh"        
    end

end