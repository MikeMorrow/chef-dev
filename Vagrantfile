# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', 2048,
                  '--cpus', 2, '--ioapic', 'on']          
  end
  config.ssh.forward_x11 = true
  # ---------------------------------------------------------------------------
  #
  # ---------------------------------------------------------------------------
  config.vm.define :chefDev do |chefDev|
    #chefDev.vm.box = "MikeMorrow/centos.7.2"
    chefDev.vm.box  = "ubuntu/trusty64"
    # Networking
    chefDev.vm.network :private_network, ip: "192.168.3.2"
    chefDev.vm.hostname = 'chefDev'
    # Apache httpd
    chefDev.vm.network :forwarded_port, guest: 8080,  host: 8080
    #
    #chefDev.vm.provision "shell", path: "scripts/installTools.sh"
    chefDev.vm.provision "shell", path: "scripts/installUbuntu.sh"
    chefDev.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "../cookbooks"
      chef.run_list = [
        'recipe[devops::default]'
      ]
    end
  end
end
