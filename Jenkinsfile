pipeline {
    agent any
    stages {
        
             
        
        stage('checkout') {
            steps {
             git 'https://github.com/cjpcloud/gluerepo.git'
            }
        }
        stage('terraform init') {
            steps {
             sh label: '', script: 'terraform init'
            }
        }
        stage('terraform plan') {
            steps {
            
            sh label: '', script: '''
terraform plan -var '''
            }
        }
    }
    
}
