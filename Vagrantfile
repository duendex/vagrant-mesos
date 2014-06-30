# vim:ft=ruby

Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.host_name = "devstack"
	config.vm.provision :shell, :path => 'provision.sh'
	config.vm.network "public_network"
	config.vm.provider "virtualbox" do |v|
		v.memory = 4096 
 		v.cpus = 1
	end
end
