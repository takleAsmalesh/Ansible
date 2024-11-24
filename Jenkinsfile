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
                  sudo apt-get install -y gnupg
                  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo gpg --dearmor -o /usr/share/keyrings/oracle-virtualbox.gpg
                  sudo apt-get update
                  sudo apt-get install -y virtualbox-7.0
                  sudo apt-get install vagrant
                  sudo apt-get update
                  vagrant up --provider=virtualbox
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

                // echo "deb [signed-by=/usr/share/keyrings/oracle-virtualbox.gpg] https://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
