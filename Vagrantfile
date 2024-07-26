Vagrant.configure("2") do |config|

    config.vm.box = "gyptazy/ubuntu22.04-arm64"
  
    config.vm.network "private_network", type: "dhcp"
  
    config.vm.provider "vmware_fusion" do |vb|
      vb.memory = "1024"
      vb.cpus = "2"
    end
  
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y apache2
    SHELL
  end