pipeline {
    agent any
    parameters {
        string(name: 'glue_db_name', defaultValue: '', description: 'How should I greet the world?')
    }
 
    stages {
        
        stage('checkout') {
            steps {
             git credentialsId: 'ab45fcb1-d309-4603-b00c-7f69cfda2c9b', url: 'https://github.com/shenadev/gluerepo.git'
            }
        }
        stage('terraform init') {
            steps {
             sh label: '', script: 'terraform init'
            }
        }
        stage('terraform plan') {
            steps {
            
                sh label: '', script: 'terraform plan -var glue_db_name=${params.glue_db_name}'     
            }
        }
    
    

    }
}
