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
                  # Update apt and install dependencies
                  sudo apt-get update
                  sleep 10

                  # Add VirtualBox repository and install public key
                  sudo sh -c 'echo "deb https://download.virtualbox.org/virtualbox/debian bookworm contrib" > /etc/apt/sources.list.d/virtualbox.list'
                  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo tee /etc/apt/trusted.gpg.d/virtualbox.asc
                  
                  # Remove duplicate repository entries
                  sudo rm /etc/apt/sources.list.d/archive_uri-https_download_virtualbox_org_virtualbox_debian-bookworm.list
                  
                  # Update apt again after cleaning up the repo
                  sudo apt-get update
                  sleep 10

                  # Install VirtualBox and Vagrant
                  sudo apt-get install -y vagrant virtualbox-7.1
                  sleep 10

                  # Start Vagrant environment with VirtualBox provider
                  sudo vagrant up --provider=virtualbox
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
