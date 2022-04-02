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
    }
    stage('Hardening Score') {
         failFast true
            parallel {
                stage('Building') {
                    steps {
                        
                        sh 'chmod +x validation.sh'
                        
                        sh "./validation.sh | tee output.log"
                        
                        sh '! grep "image_success" output.log'

                        script {
                            BUILD_COMPLETE = true
                        }
                    }
                }
                stage('validating the logs') {
                    steps {
                        script {
                            while (BUILD_COMPLETE != true) {
                                sh '! grep "image_success" output.log'
                            }
                        }
                    }
                }
            }
        }
}

    // stage('Push image') {
        
      //  docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_praveen') {
        //    app.push("${env.BUILD_NUMBER}")
        // }
    // }
    
   // stage('Trigger ManifestUpdate') {
     //           echo "triggering updatemanifestjob"
       //         build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
       // } 
