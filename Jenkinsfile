# -- --
# -- CI/CD pipeline for service-a
# -- NOTE: this pipeline has not been fully tested
pipeline {

  agent none;

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
          withCredentials() {
            dir("terraform") {
              sh """
                /bin/bash cd-deploy-infra.sh apply
              """
            }
          }
        }
      }

      stage("Deploy Service") {
        agent { label 'ansible' }
        steps {
          sshagent() {
              sh """
                /bin/bash cd-deploy-service.sh
              """
          }
        }
      }

      stage("clean up") {
        agent { label 'terraform' }
        steps {
          withCredentials() {
            dir("terraform") {
              sh """
                /bin/bash cd-deploy-infra.sh destroy
              """
            }
          }
        }
      }
    }
}
