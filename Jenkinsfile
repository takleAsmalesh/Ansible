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
                sh "apt-get update && apt-get install vagrant -y"
                sh "vagrant up"
            }
        }
        stage('Perform Tests') {
            steps {

              sh "curl -I http://192.168.56.12"
            }
        }
    }
}
// pipeline {
//     agent { label 'agent1' }

//     stages {
//         stage('Obtain the Code') {
//             steps {
//                 checkout scm
//             }
//         }

//         stage('Launch Environment') {
//             steps {
//                 // Start Vagrant VMs
//                 sh '''
//                 vagrant up 
//                 '''
//             }
//         }

//         stage('Perform Tests') {
//             steps {
//                 echo "Performing infrastructure and application tests..."
//                 sh '''
//                 curl -I http://192.168.56.12
//                 '''
//             }
//         }
//     }
// }
