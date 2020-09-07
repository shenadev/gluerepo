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
            properties([parameters([string(defaultValue: '', description: '', name: 'glue_db_name', trim: false), string(defaultValue: '', description: '', name: 'crawler_name', trim: false), string(defaultValue: '', description: '', name: 'crawler_description', trim: false), string(defaultValue: '', description: '', name: 'table_prefix', trim: false)])])
            sh label: '', script: '''
terraform plan -var glue_db_name=$glue_db_name -var  crawler_description=$crawler_description -var table_prefix=$table_prefix -var crawler_name=$crawler_name '''
            }
        }
    }
    
}
