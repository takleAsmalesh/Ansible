pipeline {
    agent any

    stages {
        stage('Obtain the Code') {
            steps {
                git branch: 'main', url: 'https://github.com/takleAsmalesh/Ansible.git'
            }
        }
        stage('Install VirtualBox and Vagrant') {
            steps {
                sh '''
                  # Remove existing VirtualBox installations
                  sudo apt-get remove --purge -y virtualbox*

                  # Add VirtualBox repository
                  sudo apt-get update
                  sudo apt-get install -y software-properties-common dkms
                  sudo apt-add-repository -y "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
                  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

                  # Install Linux headers for kernel module building
                  sudo apt-get install -y linux-headers-$(uname -r)

                  # Install VirtualBox 7.0
                  sudo apt-get update
                  sudo apt-get install -y virtualbox-7.0

                  # Rebuild VirtualBox kernel modules
                  sudo /sbin/vboxconfig || true

                  # Install the latest Vagrant
                  wget https://releases.hashicorp.com/vagrant/2.3.6/vagrant_2.3.6_amd64.deb
                  sudo dpkg -i vagrant_2.3.6_amd64.deb

                  # Verify installations
                  vboxmanage --version || exit 1
                  vagrant --version || exit 1
                '''
            }
        }
        stage('Launch Environment') {
            steps {
                sh '''
                  # Start the Vagrant environment with VirtualBox
                  sudo vagrant up --provider=virtualbox
                '''
            }
        }
        stage('Perform Tests') {
            steps {
                sh '''
                  # Perform a simple HTTP test
                  curl -I http://192.168.56.12
                '''
            }
        }
    }
}
