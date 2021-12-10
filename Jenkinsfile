/* -- --
   -- CI/CD pipeline for service-a
*/
pipeline {

  agent none;

  options {
    ansiColor('xterm')
    buildDiscarder(logRotator(
          daysToKeepStr: '10',
          numToKeepStr: '10'
    ))
  }

    stages {

      stage("Build Image and Test Image") {
        agent { label 'docker' }
        steps {
            script {
              sh """
                /bin/bash ci-build.sh
              """
            }
        }
      }

      stage("Deploy Infrastructure") {
        agent { label 'terraform' }
        steps {
          withAWS(credentials: "awscreds") {
              sh """
                printenv | grep AWS
                /bin/ash cd-deploy-infra.sh apply
              """
          }
        }
      }

      stage("Deploy Service") {
        steps {
            ansiblePlaybook(
                credentialsId: 'jenins-ssh-key',
                playbook: 'site.yml',
                disableHostKeyChecking: true
            )
        }
      }

      stage("clean up") {
        agent { label 'terraform' }
        steps {
          withAWS(credentials: "awscreds") {
              sh """
                /bin/ash cd-deploy-infra.sh destroy
              """
          }
        }
      }
    }
}
