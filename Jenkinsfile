pipeline {
    agent any

    environment {
        VAGRANT_HOME = "${env.WORKSPACE}/.vagrant" 
    }

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
                sudo apt install virtualbox
                sudo apt install vagrant
                vagrant up || (echo "Failed to start Vagrant VMs" && exit 1)
                '''
            }
        }

    //     stage('Perform Tests') {
    //         steps {
    //             echo "Performing infrastructure and application tests..."
    //             sh '''
    //             curl -I http://192.168.56.12
    //             '''
    //         }
    //     }
    // }

    // post {
    //     always {
    //         echo "Cleaning up the environment..."
    //         // Destroy the VMs after the tests
    //         sh ''' vagrant destroy -f || true '''
    //     }
    }
}
