# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure(2) do |config|
	# The most common configuration options are documented and commented below.
	# For a complete reference, please see the online documentation at
	# https://docs.vagrantup.com.

	# Every Vagrant development environment requires a box. You can search for
	# boxes at https://atlas.hashicorp.com/search.
	config.vm.box = "puphpet/centos65-x64"

	# Shell script to run after provisioning VM
	config.vm.provision :shell, path: "scripts/provision.sh"

	# Create a forwarded port mapping which allows access to a specific port
	# within the machine from a port on the host machine. In the example below,
	# accessing "localhost:8080" will access port 80 on the guest machine.
	config.vm.network "forwarded_port", guest: 80, host: 8080

	# Use host SSH keys
	config.ssh.forward_agent = true

	# VM specifications
	config.vm.provider "virtualbox" do |v|
		v.name = "ubvoting"
		v.cpus = 2
		v.memory = 2048
	end
end
