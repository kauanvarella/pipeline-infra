pipeline {
    agent { dockerfile true }
    stages {       
        stage('---------- Provisionando Infraestrutura de Producao ----------') {
            steps {
                dir('./prod') {
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'terraform-aws', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        script {
                            try {
                                sh 'terraform destroy -target module.aws-prod.aws_instance.app_server -auto-approve'
                            } 
                            catch (err) {
                                echo 'Ainda nao existiam instancias de producao, criando uma nova'
                            }
                        }                    
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }  
                }
            }
        }
        stage('---------- Provisionando Infraestrutura de Homologacao ----------') {
            steps {
                dir('./homolog') {
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'terraform-aws', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        script {
                            try {
                                sh 'terraform destroy -target module.aws-homolog.aws_instance.app_server -auto-approve'
                            } 
                            catch (err) {
                                echo 'Ainda nao existiam instancias de homologacao, criando uma nova'
                            }
                        }                    
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }  
                }
            }
        }
        stage('---------- Instalando as dependencias de producao----------') {
            steps {
                sh 'sleep 15'
                dir('./infra') {
                    sh 'chmod 600 ssh-prod-meuapp.pem'
                }
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts-infra-prod.yml', playbook: 'playbook-infra.yml'
            }
        }
        stage('---------- Instalando as dependencias de homologacao ----------') {
            steps {
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts-infra-homolog.yml', playbook: 'playbook-infra.yml'
            }
        }        
    }
}