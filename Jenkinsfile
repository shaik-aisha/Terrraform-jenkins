pipeline {
    agent any
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-dev-account-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-dev-account-secret-key')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/shaik-aisha/Terraform-jenkins.git'
            }
        }
        stage('Terraform Init & Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform show -no-color tfplan > tfplan.txt'
                }
            }
        }
        stage('Approval') {
            when { not { equals expected: true, actual: params.autoApprove } }
            steps {
                script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?", parameters: [text(name: 'Plan', description: 'Review the plan', defaultValue: plan)]
                }
            }
        }
        stage('Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -input=false tfplan'
                }
            }
        }
    }
}
