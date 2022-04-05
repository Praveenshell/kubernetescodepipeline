pipeline {
    def app
    stages {
        stage ('Clone repositroy') {
            checkout scm
        }
        stage ('Build Image') {
            app = docker.build("praveenshell123/test")
        }
        stage ('Test Image') {
            app.inside {
                sh 'echo "Test Passed"'
            }
        }
        stage('Hardening Score') {
            sh 'chmod +x validation.sh'
            sh "./validation.sh | tee output.log"
            sh "echo `cat output.log`
           }
    }      
