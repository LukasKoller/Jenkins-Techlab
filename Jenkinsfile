@Library('jenkins-techlab-lib') _

pipeline {
    agent {
        docker {
            image 'ruby:2.7.1'
          }
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
        timeout(time: 10, unit: 'MINUTES')
        timestamps()  // Timestamper Plugin
        disableConcurrentBuilds()
    }
    stages {
        stage('Info') {
            steps {
                installBundle()
                sh  """#!/bin/bash
                    ruby --version
                    bundle --version
                """
            }
        }
    }
}
