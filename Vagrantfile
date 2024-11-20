Vagrant.configure("2") do |config|
  # Define the first VM (web1)
  config.vm.define "web1" do |web1|
    web1.vm.box = "generic/centos9s" 
    web1.vm.hostname = "web1"
    web1.vm.network "private_network", ip: "192.168.56.10"
    web1.vm.provision "ansible" do |ansible|
      ansible.playbook = "install_apache.yml"
      ansible.inventory_path = "hosts.ini"
    end
  end

  # Define the second VM (web2)
  config.vm.define "web2" do |web2|
    web2.vm.box = "generic/centos9s"
    web2.vm.hostname = "web2"
    web2.vm.network "private_network", ip: "192.168.56.11"
    web2.vm.provision "ansible" do |ansible|
      ansible.playbook = "install_apache.yml"
      ansible.inventory_path = "hosts.ini"
    end
  end

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


