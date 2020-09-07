pipeline {
    agent any
    stages {
        
             
        parameters {
            string(name: 'glue_db_name', defaultValue: 'Hello', description: 'How should I greet the world?')
            string(name: 'table_prefix', defaultValue: 'Hello', description: 'How should I greet the world?') 
            string(name: 'crawler_name', defaultValue: 'Hello', description: 'How should I greet the world?')
            string(name: 'crawler_description', defaultValue: 'Hello', description: 'How should I greet the world?') 
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
terraform plan -var glue_db_name=${params.glue_db_name} -var  crawler_description=${params.crawler_description} -var table_prefix=${params.table_prefix} -var crawler_name=${params.crawler_name} '''
            }
        }
    }
    
}
