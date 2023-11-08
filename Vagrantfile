# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE_NAME = "ubuntu/jammy64"

Vagrant.configure("2") do |config|
    config.vm.boot_timeout = 600
    config.vm.define "plane" do |plane|
        plane.vm.box = IMAGE_NAME
        plane.vm.hostname = "plane"
        plane.vm.network "private_network", ip: "172.16.1.100"
        plane.vm.network "public_network", :bridge => 'wlp0s20f3'
        plane.vm.provider "virtualbox" do |vb|
            vb.name = "Plane"
            vb.cpus = 4
            vb.memory = 4096
            vb.customize ["modifyvm", :id, "--groups", "/K8S"]
        end
        plane.vm.provision "shell", path: "plane.sh"        
    end

    config.vm.define "worker1" do |worker1|
        worker1.vm.box = IMAGE_NAME
        worker1.vm.hostname = "worker1"
        worker1.vm.network "private_network", ip: "172.16.1.101"
        worker1.vm.network "public_network", :bridge => 'wlp0s20f3'
        worker1.vm.provider "virtualbox" do |vb|
            vb.name = "Worker1"
            vb.cpus = 2
            vb.memory = 2048
            vb.customize ["modifyvm", :id, "--groups", "/K8S"]
        end
        worker1.vm.provision "shell", path: "worker1.sh"        
    end

    config.vm.define "worker2" do |worker2|
        worker2.vm.box = IMAGE_NAME
        worker2.vm.hostname = "worker2"
        worker2.vm.network "private_network", ip: "172.16.1.102"
        worker2.vm.network "public_network", :bridge => 'wlp0s20f3'
        worker2.vm.provider "virtualbox" do |vb|
            vb.name = "Worker2"
            vb.cpus = 2
            vb.memory = 2048
            vb.customize ["modifyvm", :id, "--groups", "/K8S"]
        end
        worker2.vm.provision "shell", path: "worker2.sh"        
    end

    config.vm.define "nfs" do |nfs|
        nfs.vm.box = IMAGE_NAME
        nfs.vm.hostname = "nfs"
        nfs.vm.network "private_network", ip: "172.16.1.103"
        nfs.vm.network "public_network", :bridge => 'wlp0s20f3'
        nfs.vm.provider "virtualbox" do |vb|
            vb.name = "NFS"
            vb.cpus = 2
            vb.memory = 1024
            vb.customize ["modifyvm", :id, "--groups", "/K8S"]
        end       
    end

end