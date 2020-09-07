pipeline {
    agent any
    
    properties([parameters([string(defaultValue: '', description: '', name: 'glue_db_name', trim: false)])])
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
terraform plan -var glue_db_name=$glue_db_name '''
            }
        }
    }
    
}
