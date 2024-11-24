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

                  sudo sh -c 'echo "deb https://download.virtualbox.org/virtualbox/debian bookworm contrib" > /etc/apt/sources.list.d/virtualbox.list'
                  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo tee /etc/apt/trusted.gpg.d/virtualbox.asc
                  
                  # Update apt again after adding VirtualBox repo
                  sudo apt-get update
                  sleep 10

                  sudo apt-get install -y vagrant virtualbox
                  sleep 10
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
