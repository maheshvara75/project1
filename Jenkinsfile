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
        stage('Approval') {
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
                [ec2]
                ${env.PUBLIC_IP}

                [ec2:vars]
                ansible_user=ubuntu
                ansible_ssh_private_key_file=~/.ssh/ec2pro3_pem.pem
                """
                sh 'ansible-playbook -i inventory install_java.yml'
            }
        }
    }
}

