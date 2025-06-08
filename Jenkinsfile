pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = "/root/gcp-key.json"
    }

    stages {
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Apply') {
            steps {
                input "Apply changes?"
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
