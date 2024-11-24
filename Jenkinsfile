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
                  sudo apt-get install -y vagrant libvirt-daemon-system libvirt-clients qemu
                  sudo systemctl enable libvirtd
                  sudo systemctl start libvirtd
                  sudo usermod -aG libvirt $(whoami)
                  vagrant plugin install vagrant-libvirt
                  sudo vagrant up
                '''
                // sh '''
                //   sudo apt-get update
                //   sudo apt-get install -y vagrant
                //   sudo vagrant up
                // '''
            }
        }
        stage('Perform Tests') {
            steps {

              sh "curl -I http://192.168.56.12"
            }
        }
    }
}
