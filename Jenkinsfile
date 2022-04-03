pipeline {
    agent any
    environment {
        Build_complete = true
    }
    stages {
        stage ('Clone repositroy') {
            checkout scm
        }
        stage ('Build Image') {
            app = docker.build("praveenshell123/test")
        }
        stage ('Test Image') {
            app.inside {
                sh 'echo "Test Passed"
            }
        }
        
        stage('Hardening Score') {
            sh 'chmod +x validation.sh'
            sh "./validation.sh | tee output.log"
            sh '! grep "image_failure" output.log'
            script {
                Build_complete = true
            }
        }
        stage ('valid') {
            steps {
                script {
                    while (Build_complete != true) {
                        sh '! grep "image_failure" output.log'
                        sh 'echo "Machi working"'
                    }
                }
            }
        }            
    }
}
            
            
