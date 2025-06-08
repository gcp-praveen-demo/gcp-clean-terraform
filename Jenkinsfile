pipeline {
    agent {
        docker {
            image 'ubuntu:latest'
            args '-u root'
        }
    }

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = "/root/gcp-key.json"
        TF_VAR_project_id = 'devops-lab-praveen'
        TF_VAR_region = 'us-central1'
    }

    stages {
        stage('Install Docker and Terraform') {
            steps {
                sh 'apt-get update'
                sh 'apt-get install -y wget gnupg apt-transport-https ca-certificates'

                # Install Docker
                sh 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg'
                sh 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null'
                sh 'apt-get update'
                sh 'apt-get install -y docker-ce docker-ce-cli containerd.io'
                sh 'docker --version'

                # Install Terraform
                sh 'wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg'
                sh 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list'
                sh 'apt-get update'
                sh 'apt-get install -y terraform'
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