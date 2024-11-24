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
                  # Remove existing VirtualBox installations
                  sudo apt-get remove --purge -y virtualbox*

                  # Add VirtualBox repository
                  sudo apt-get update
                  sudo apt-get install -y software-properties-common dkms
                  sudo apt-add-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
                  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

                  # Install VirtualBox 6.1
                  sudo apt-get update
                  sudo apt-get install -y virtualbox-6.1

                  # Load VirtualBox kernel module
                  sudo modprobe vboxdrv

                  # Install latest Vagrant
                  wget https://releases.hashicorp.com/vagrant/2.3.6/vagrant_2.3.6_amd64.deb
                  sudo dpkg -i vagrant_2.3.6_amd64.deb


                  vagrant plugin uninstall vagrant-libvirt || true

                  sudo vagrant up --provider=virtualbox
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
