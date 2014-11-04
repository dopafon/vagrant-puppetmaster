Vagrant.configure("2") do |config|

  config.vm.define :puppetmaster do |n|
			n.vm.provider "virtualbox" do |v|
				v.memory = 512
			end
			n.vm.network :private_network, ip: "192.168.50.4"
      n.vm.box = "matyunin/centos7"
      n.vm.host_name = "puppet.puppet.test"
#      n.vm.share_folder "hieradata", "/etc/puppet/hieradata", "~/vagrant/puppet/puppetmaster/hieradata"
      n.vm.synced_folder "~/vagrant/files", "/export"
      n.vm.synced_folder "puppet", "/etc/puppet"
      n.vm.provision :shell, :path => "centos7-bootstrap.sh"
      n.vm.provision :shell, :inline => "/usr/bin/puppet master --manifest=/etc/puppet/manifests/site.pp"
  end


  config.vm.define :puppet2 do |n|
			n.vm.provider "virtualbox" do |v|
				v.memory = 512
			end
			n.vm.network :private_network, ip: "192.168.50.9"
      n.vm.box = "opensuse13.1-msc_v3"
      n.vm.host_name = "devpuppet.puppet.test"
      n.vm.provision :shell, :path => "opensuse131.sh"
			n.vm.provision :shell, :inline => "echo \"192.168.50.4 puppet.puppet.test puppet\" >> /etc/hosts"
      n.vm.provision :puppet_server do |puppet|
        puppet.puppet_server = "puppet.puppet.test"
        puppet.facter = { "domain" => "puppet.test" }
        puppet.options = "--verbose --report true"
      end
  end
  
end
