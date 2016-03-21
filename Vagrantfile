nodes = [
  { :hostname => "packer-ubuntu", :ip => "172.16.0.42", :box => "bento/ubuntu-14.04", :ram => "512", :cpus => 1},
]

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false

  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.hostname = node[:hostname]
      node_config.vm.network :private_network, ip: node[:ip]
      node_config.vm.provider :virtualbox do |vb|
        vb.memory = node[:ram]
        vb.cpus = node[:cpus]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
      end
    end
  end
end
