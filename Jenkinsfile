pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = "/root/gcp-key.json"
        TF_VAR_project_id = 'devops-lab-praveen'         // Replace with your GCP project ID if needed in your main.tf
        TF_VAR_region = 'us-central1'                   // Replace with your desired GCP region if needed in your main.tf
    }

    stages {
        stage('Install Terraform') {
            steps {
                sh 'wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg'
                sh 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list'
                sh 'sudo apt-get update'
                sh 'sudo apt-get install terraform'
                sh 'terraform --version'
            }
        }

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