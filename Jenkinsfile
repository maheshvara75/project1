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
        stage('Ansible Setup') {
            steps {
                dir('ansible') {
                    sh 'aansible-playbook -i inventory ansible/playbook.yaml --private-key=/home/maheshvara4gmai/terraform-ansible-jenkins/terraform/ec2pro2_pem'
                }
            }
        }
    }
}

