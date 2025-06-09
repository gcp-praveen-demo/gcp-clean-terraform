pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = "/root/gcp-key.json"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/gcp-praveen-demo/gcp-clean-terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('gcp-clean-terraform') {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('gcp-clean-terraform') {
                    sh 'terraform plan -input=false'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('gcp-clean-terraform') {
                    sh 'terraform apply -auto-approve -input=false'
                }
            }
        }
    }
}
