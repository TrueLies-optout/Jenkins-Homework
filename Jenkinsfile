pipeline {
    agent {
        node { // slave node megadása
            label 'slave'
        }
    }
    stages {
        stage('Script letöltése GIT-ből') {
            steps {
                sh 'curl -o apache_install.sh https://raw.githubusercontent.com/TrueLies-optout/Jenkins-Homework/main/apache_install.sh'
            }
        }    
         
        stage ('Script futtatása') {
            steps {
                sh "bash -c 'chmod +x ./apache_install.sh'"
                sh "bash -c './apache_install.sh'"
            }
            post {
                always {
                    // Mentsük el az apache_install_date.txt fájlt az Artifact-ok közé
                    archiveArtifacts 'apache_install_date.txt'
                }
            }
        }
    }
}
