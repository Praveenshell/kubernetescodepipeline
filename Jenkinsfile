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
        echo "Testing score is $SCORE"
    }
   stage('Stage 3') {
      // steps {
        //    script {
                //if (env.STATUS == 'SUCCESS1') {
                    if (myVar == 'success') {
                        echo 'SUCCESS **************'
                        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_praveen') {
                               app.push("${env.BUILD_NUMBER}")
                        }
                            } else {
                        echo 'Not SUCCESS *********'
                            }
          //              }
            //    }
    }
        
        
        
        
   // stage('Push image') {
     //   when {
       //   expression { myVar == 'success' }
        // }
        // echo "what am i doing here"            
    // }
}
