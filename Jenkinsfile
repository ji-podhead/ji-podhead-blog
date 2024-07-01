pipeline {
    agent any // Verwendet einen beliebigen verfügbaren Agenten

    stages {
        stage('Checkout') {
            steps {
                git 'git@github.com/ji-podhead/ji-podhead-blog.git' // Ersetzen Sie durch Ihre Git-URL
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Push Changes') {
            steps {
                script {
                    // Überprüfen Sie, ob es Änderungen gibt, bevor Sie pushen
                    if (git diff --exit-code HEAD^ HEAD) {
                        sh 'git add.'
                        sh 'git commit -m "Automated build"'
                        sh 'git push origin master' // Ersetzen Sie 'master' durch Ihren Branch
                    } else {
                        echo "Keine Änderungen seit dem letzten Commit."
                    }
                }
            }
        }
    }
}
