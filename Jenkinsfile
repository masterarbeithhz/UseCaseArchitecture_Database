pipeline {

  environment {
    giturl = 'https://github.com/masterarbeithhz/UseCaseArchitecture_Database.git/'
    PROJECT_ID = 'crafty-sound-297315'
    CLUSTER_NAME = 'cluster-6'
    LOCATION = 'us-central1-c'
    CREDENTIALS_ID = 'crafty-sound-297315'
  }
  
  agent any

  stages {

    stage('Checkout groovy') {
      steps {
        git url:"https://github.com/masterarbeithhz/CustomerConfiguration.git", branch:'main'
        
      }
    }

    stage("Load config") {
      steps {
        script {
          load "${customer_groovy}.groovy"
          echo "${env.UC_CUSTOMER}"
          echo "${env.UC_DBNAME}"
          echo "${env.UC_DBUSER}"
          echo "${env.UC_DBDB}"
          echo "${env.UC_DBPSWD}"
          echo "${env.UC_DOMAIN}"
        }
      }
    }

    stage("Prepare Yaml") {
        steps {
          script {
            def data = readFile file: "kubmanifest.yaml"
            data = data.replaceAll("JSVAR_UC_DBNAME", "${env.UC_DBNAME}")
            data = data.replaceAll("JSVAR_UC_DBPSWD", "${env.UC_DBPSWD}")
            data = data.replaceAll("JSVAR_NAMESPACE", "${env.C_NAMESPACE}")
            echo data
            writeFile file: "kubmanifest.yaml", text: data
          }
        }
      }

    stage('Checkout Source') {
      steps {
        git url:"${giturl}", branch:'main'
      }
    }
          
    stage('Deploy to GKE') {
        steps{
            step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'kubmanifest.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
        }
    }

  }

}
