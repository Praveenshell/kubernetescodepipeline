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
    stage('validate') {
  

        script {
            sh 'bash /mnt/validation.sh"'
        }
    }
}
    //stage('Push image') {
        
      //  docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_praveen') {
        //    app.push("${env.BUILD_NUMBER}")
        //}
    //}
    
   // stage('Trigger ManifestUpdate') {
     //           echo "triggering updatemanifestjob"
       //         build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
       // }

