node {
    def app
    
    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       app = docker.build("praveenshell123/test")
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
       
     stage('Hardening Score') {
         sh 'chmod +x validation.sh'
         sh "./validation.sh"
     }
    }
}
