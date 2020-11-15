# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'vsphere'
Vagrant.configure("2") do |config|

    #config.vm.box = "1804" #save time using your own box template. otherwise use:
    #config.vm.box = "hashicorp/bionic64"

    # lines below are for vsphere
    config.vm.box = 'vsphere'
    config.vm.box_url = 'vsphere-box/vsphere.box'
    config.ssh.username ='ubuntu'
    config.ssh.password ='asasas'
    # /vsphere
  
    #if you have a smaller machine, modify resources
   config.vm.provider "virtualbox" do |vb| #or hyperv
     vb.linked_clone = true
     vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
     vb.memory = "4048"
     vb.cpus = "4"
     vb.name = "k8s.nginx.rocks" # vmname for hyperv/name for virtualbox
   end
   config.vm.provider :vsphere do |vsphere|
    vsphere.host = 'vcsa.lan'
    vsphere.insecure = true
    # vsphere.compute_resource_name = 'YOUR COMPUTE RESOURCE'
    # vsphere.resource_pool_name = 'YOUR RESOURCE POOL'
    vsphere.clone_from_vm = true
    vsphere.template_name = 'template-ubuntu1804'
    vsphere.name = 'k8s.nginx.rocks'
    vsphere.user = 'administrator@vsphere.local'
    vsphere.password = 'Aass1122!'
    vsphere.memory_mb  = "4048"
    vsphere.cpu_count = "4"
 end

    config.vm.synced_folder ".", "/vagrant", disabled: false
    config.vm.hostname = "k8s.nginx.rocks" 
    # https://github.com/devopsgroup-io/vagrant-hostmanager
    # vagrant plugin install vagrant-hostmanager
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = true
    config.hostmanager.include_offline = true
    config.vm.define 'k8s.nginx.rocks' do |node|
      node.vm.hostname = 'k8s.nginx.rocks'
      #node.vm.network :private_network, ip: '192.168.99.99'
      node.hostmanager.aliases = %w(cafe.example.com cafe.nginx.rocks k8s.nginx.rocks k8s-dashboard.nginx.rocks k8s-vs.nginx.rocks kic-waf.nginx.rocks zipkin.nginx.rocks prometheus.nginx.rocks grafana.nginx.rocks )
    end
    config.vm.network "public_network",
      use_dhcp_assigned_default_route: true

      config.vm.provision "file", source: ".", destination: "$HOME/vagrant"
  
    config.vm.provision "shell", path: "2.docker-install.sh", privileged: false
    config.vm.provision "shell", path: "3.apt-installs-kube.sh", privileged: true
    config.vm.provision "shell", path: "4.kubeadm.sh", privileged: false
    config.vm.provision "shell", path: "5.kubectl-config.sh", privileged: false
    config.vm.provision "shell", path: "6.cni-network.sh", privileged: false
    
    config.vm.provision "shell", path: "8.prometheus.sh",args: "k8s.nginx.rocks", privileged: false
    config.vm.provision "shell", path: "9.grafana.sh",args: "k8s.nginx.rocks", privileged: false
    
    config.vm.provision "shell", path: "11.docker-registry.sh", privileged: false
    config.vm.provision "shell", path: "7.manifests-plus-ingress-install.sh", privileged: false
    config.vm.provision "shell", path: "10.create-apps.sh", privileged: false
  end
    
