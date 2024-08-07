Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/ubuntu2004"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2
  end

  config.vm.network "forwarded_port", guest: 8000, host: 8000
  
  config.ssh.insert_key = false
  config.vm.boot_timeout = 600 
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = "vv"
    ansible.inventory_path = "inventory"
    ansible.extra_vars = {
      ansible_user: 'vagrant'
    }
  end
end
