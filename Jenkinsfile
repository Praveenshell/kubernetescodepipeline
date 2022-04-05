node {
    def app
    stage ('clone repository') {
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
    stage ('Hardening scripts') {
        sh 'chmod +x validation.sh'
        sh "./validation.sh > out.txt"
        script {
            myVar = readFile('out.txt').trim()
        }
        echo "${myVar}"
    }
    stage('Push image') {
        when {
            expression { myVar == 'success' }
            }
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_praveen') {
            app.push("${env.BUILD_NUMBER}")
            }
        }
    }
}
