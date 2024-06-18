pipeline {
    agent any
    
    environment {
        // Define environment variables
        TF_VAR_FILE = "terraform.tfvars"
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
	      AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
	      AWS_SESSION_TOKEN = credentials('AWS_SESSION_TOKEN')
    }
    
    stages {
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=plan.out'
                }
            }
        }
        stage('Plan Approval') {
            steps {
                input 'Do you want to apply the plan?'
            }
        }
        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply plan.out'
                }
            }
        }
	stage('Ansible Playbook Approval') {
            steps {
                input 'Do you want to run the playbook?'
            }
        }
	stage('Get EC2 Public IP') {
            steps {
                script {
                    env.PUBLIC_IP = sh(script: 'cat public_ip.txt', returnStdout: true).trim()
                }
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                writeFile file: 'inventory', text: """
                [all]
                ${env.PUBLIC_IP}
                """
                sh 'ansible-playbook -i inventory playbook.yaml --private-key=../terraform/ec2pro4_pem'
            }
        }
    }
}
