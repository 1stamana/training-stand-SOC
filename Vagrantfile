Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox"

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vm.box_check_update = false
  end

 config.vm.define "wordpress" do |mach1|
    mach1.vm.box = "DEF1"
    mach1.vm.network "private_network", virtualbox__intnet: "intnet", ip: "192.168.1.5", auto_config: false
    mach1.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"
    mach1.vm.provider "virtualbox" do |vb|
      vb.memory = "3000"
      vb.cpus = 2
    end
    mach1.ssh.username = "adminwp"
    mach1.ssh.password = "ghsdfgsh"
  end
  
  config.vm.define "attack" do |mach3|
    mach3.vm.box = "ATTACK"
    mach3.vm.network "private_network", virtualbox__intnet: "intnet", ip: "10.10.0.11", auto_config: false
    mach3.vm.network "forwarded_port", guest: 22, host: 2224, id: "ssh"
    mach3.vm.provider "virtualbox" do |vb|
      vb.memory = "2000"
      vb.cpus = 1
    end
    mach3.ssh.username = "kali"
    mach3.ssh.password = "awegsdew"
  end
  
  config.vm.define "elk" do |mach2|
    mach2.vm.box = "ELKMON"
    mach2.vm.network "private_network", virtualbox__intnet: "intnet", ip: "192.168.1.10", auto_config: false
	mach2.vm.network "private_network", virtualbox__intnet: "intnet", ip: "10.10.0.15", auto_config: false
    mach2.vm.network "forwarded_port", guest: 22, host: 2223, id: "ssh"
	mach2.vm.network "forwarded_port", guest: 5601, host: 5601, id: "elk"
    mach2.vm.provider "virtualbox" do |vb|
      vb.memory = "3000"
      vb.cpus = 2
    end
    mach2.ssh.username = "adminelk"
    mach2.ssh.password = "gtruiygs"
	
	mach2.vm.provision "shell", run: "always" do |s|
    s.inline = <<-SHELL
      # Задержка перед выполнением
	  echo "Kibana доступна 127.0.0.1:5601"
	  echo "выполните, что создать пользователя kibana: vagrant ssh elk -c '/home/./elastic.sh'"
	  
	  echo "выполните, что начать атаку: vagrant ssh attack -c 'cd /home && sudo ./main.sh'"
    SHELL
	end
  end
 
end
