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
                  sudo apt-get install -y vagrant virtualbox
                  sleep 10
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
