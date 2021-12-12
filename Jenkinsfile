/* -- --
   -- CI/CD pipeline for service-a
 */
pipeline {

  agent any;

  options {
    ansiColor('xterm')
      disableConcurrentBuilds()
      buildDiscarder(logRotator(
        daysToKeepStr: '10',
        numToKeepStr: '10'
      ))
  }

  parameters {
    string(name: 'DELAY_BEFORE_CLEANUP', defaultValue: '60', description: 'Seconds to wait before cleanup stage')
  }

  stages {

    stage("Build Image and Test Image") {
      agent { label 'docker' }
      steps {
        script {
          sh '''
            /bin/bash ci-build.sh
          '''
        }
      }
    }

    stage("Deploy Infrastructure") {
      agent { label 'terraform' }
      steps {
        withAWS(credentials: "awscreds") {
          sh '''
            printenv | grep AWS
            /bin/ash cd-deploy-infra.sh apply
          '''
        }
      }
    }

    stage("Deploy Service") {
      agent { label 'ansible' }
      steps {
        withAWS(credentials: "awscreds") {
          sshagent(credentials: ["jenkins-ssh-key"]) {
            sh '''
              git submodule update --init --recursive
              ansible-inventory -i inventory --graph
              ansible-playbook -i inventory -l tag_Name_dev_jenkins_nginx site.yml
            '''
          }
        }
      }
    }

    stage("clean up") {
      agent { label 'terraform' }
      steps {
        sleep $DELAY_BEFORE_CLEANUP
        withAWS(credentials: "awscreds") {
          sh '''
            /bin/ash cd-deploy-infra.sh destroy
          '''
        }
      }
    }
  }

  //TODO: add post stage if need
}

