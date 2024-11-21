pipeline {
    agent { label 'agent1' }
    
    stages {
        stage('Obtain the Code') {
            steps {
                checkout scm
            }
        }

        stage('Launch Environment') {
            steps {
                // Start Vagrant VMs
                sh '''
                vagrant up 
                '''
            }
        }

        stage('Perform Tests') {
            steps {
                echo "Performing infrastructure and application tests..."
                sh '''
                curl -I http://192.168.56.12
                '''
            }
        }
    }
}
