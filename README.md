
### Create Vagrantfile with 2 web server and run
  - run command vagrant up # setup all Vms
  - run vagrant status #make sure all 3 app running

### Connect to Vagrant web1, web2 server and LB
    ssh -i ~/Cognyte/Test/.vagrant/machines/web1/virtualbox/private_key vagrant@192.168.56.10
    ssh -i ~/Cognyte/Test/.vagrant/machines/web2/virtualbox/private_key vagrant@192.168.56.11
    ssh -i ~/Cognyte/Test/.vagrant/machines/nginx-lb/virtualbox/private_key vagrant@192.168.56.12


#### ping to web server and check httpd
    curl http://192.168.56.11
    systemctl status httpd

### connect to webserver 
    http://192.168.56.10/
    http://192.168.56.11/


    docker run -d --name nginx-lb -p 80:80 \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
    nginx:latest


### Jenkins
    http://0.0.0.0:8080/


