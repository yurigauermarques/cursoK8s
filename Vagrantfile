# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

env = YAML.load_file('env.yaml')

Vagrant.configure("2") do |config|
    config.vm.boot_timeout = 600

    env.each do |env|
        config.vm.define env['name'] do |host|
          host.vm.box = env['box']
          host.vm.hostname = env['hostname']
          host.vm.network 'public_network', ip: env['ipaddress']
          host.vm.network "public_network", :bridge => env['bridge']
          host.vm.provider 'virtualbox' do |vb|
            vb.name = env['name']
            vb.cpus = env['cpu']
            vb.memory = env['memory']
            vb.customize ["modifyvm", :id, "--groups", env['group']]
          end    
          host.vm.provision "shell", path: env['provision']
        end
    end

    config.vm.define "nfs" do |nfs|
        nfs.vm.box = IMAGE_NAME
        nfs.vm.hostname = "nfs"
        nfs.vm.network "private_network", ip: "172.16.1.103"
        nfs.vm.network "public_network", :bridge => 'enp5s0'
        nfs.vm.provider "virtualbox" do |vb|
            vb.name = "NFS"
            vb.cpus = 1
            vb.memory = 1024
            vb.customize ["modifyvm", :id, "--groups", "/K8S"]
        end       
    end

end