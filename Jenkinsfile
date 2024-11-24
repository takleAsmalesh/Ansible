pipeline {
    agent any

    stages {
        stage('Obtain the Code') {
            steps {
                // Get some code from a GitHub repository
              git branch: 'main', url: 'https://github.com/takleAsmalesh/Ansible.git'                
            }
        }
        stage('Launch Environment') {
            steps {
                sh '''
                  sudo apt-get update
                  sleep 10
                  sudo apt-get install -y vagrant
                  sleep 10
                  sudo systemctl start libvirtd
                  sudo systemctl enable libvirtd
                  virsh uri
                  sudo virsh uri qemu:///system
                  sudo usermod -a -G libvirt your_username sudo newgrp libvirt 
                  sudo vagrant up
                '''
            }
        }
        stage('Perform Tests') {
            steps {

              sh "curl -I http://192.168.56.12"
            }
        }
    }
}
