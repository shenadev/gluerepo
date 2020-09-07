pipeline {
    agent any
    stages {
        
        parameters {
        string(name: 'glue_db_name', defaultValue: 'Hello', description: 'How should I greet the world?')
    }    
        
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
terraform plan -var glue_db_name=${params.glue_db_name} '''
            }
        }
    }
    
}
