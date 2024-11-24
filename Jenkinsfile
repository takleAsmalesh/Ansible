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
                  # Update package lists
                  sudo apt-get update
                  
                  # Install dependencies for VirtualBox
                  sudo apt-get install -y software-properties-common dkms

                  # Add VirtualBox repository
                  sudo apt-add-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
                  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
                  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
                  
                  # Install VirtualBox
                  sudo apt-get update
                  sudo apt-get install -y virtualbox-7.0

                  # Verify VirtualBox installation
                  vboxmanage --version

                  # Install Vagrant
                  sudo apt-get install -y vagrant

                  # Verify Vagrant installation
                  vagrant --version

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
