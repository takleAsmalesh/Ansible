Vagrant.configure("2") do |config|
  # Define the first VM (web1)
  Machines = [
  { name: "web1", ip: "192.168.56.10" },
  { name: "web2", ip: "192.168.56.11" }
  ] 

  Machines.each do |vm|
    config.vm.define vm[:name] do |node|
      node.vm.box = "generic/centos9s" 
      node.vm.hostname = vm[:name]
      node.vm.network "private_network", ip: vm[:ip]
      node.vm.provision "ansible" do |ansible|
        ansible.playbook = "install_apache.yml"
        ansible.inventory_path = "hosts.ini"
      end
    end
  end

    # Define the third VM (nginx-lb)
    config.vm.define "nginx-lb" do |lb|
      lb.vm.box = "generic/centos9s"
      lb.vm.hostname = "nginx-lb"
      lb.vm.network "private_network", ip: "192.168.56.12"
      lb.vm.provision "file", source: "vagrant/nginx.conf", destination: "/home/vagrant/nginx.conf"
      lb.vm.provision "docker" do |d|
        d.images = ["nginx:latest"]
      end
      lb.vm.provision "shell", inline: <<-SHELL
          docker run -d --name nginx-lb -p 80:80 \
          -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
          nginx:latest
      SHELL
    end
end