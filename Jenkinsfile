pipeline {
    agent any
    parameters {
        string(name: 'glue_db_name', defaultValue: 'Hello', description: 'How should I greet the world?')
    }
 
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
terraform plan -var ${params.glue_db_name} '''
            }
        }
    }
    
}
    }
}
