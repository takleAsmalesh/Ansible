### Install virtual box

### Instal Vagrant

### Create Vagrantfile with 2 web server
  - vagrant up
  - vagrant status

### Connect to Vagrant web1, web2 server and LB
    ssh -i ~/Cognyte/Test/.vagrant/machines/web1/virtualbox/private_key vagrant@192.168.56.10
    ssh -i ~/Cognyte/Test/.vagrant/machines/web2/virtualbox/private_key vagrant@192.168.56.11
    ssh -i ~/Cognyte/Test/.vagrant/machines/nginx-lb/virtualbox/private_key vagrant@192.168.56.12

### install apachi witn ansible
ansible-playbook -i hosts install_apache.yml

### uncomment #baseurl in web1
    repo_file=/etc/yum.repos.d/CentOS-Base.repo
    cp ${repo_file} ~/CentOS-Base.repo.backup
    sudo sed -i s/#baseurl/baseurl/ ${repo_file}


#### ping to web server and check httpd
    curl http://192.168.56.11
    systemctl status httpd

### connect to webserver 
    http://192.168.56.10/
    http://192.168.56.11/



    docker stop nginx-lb
    docker rm nginx-lb
    docker container prune



    docker run -d --name nginx-lb -p 80:80 \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
    nginx:latest



### Jenkins
    docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk17