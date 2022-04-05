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
            sh 'echo "Test Passed'
        }
    }
    stage ('Hardening scripts') {
        sh 'chmod +x validation.sh'
        sh './validation.sh > out.txt'
        script {
            myVar = readFile('out.txt').trim()
        }
        echo "${myVar}"
    }
}
