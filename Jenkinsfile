node('docker'){
    stage('Checkout'){
        checkout scm
    }
    stage('Check Java'){
        sh 'java -version'
    }
    stage('Set Gradlew Perm'){
        sh "chmod +x gradlew"
        sh "./gradlew task"
    }
    stage('Build BootJar'){
        sh "./gradlew bootJar"
    }
    stage('Build Docker Container'){
        sh "docker build -t ghcr.io/daviddager/spring-cloudcamp/spring:latest ."
    }
    stage('Docker Login to GHCR'){
        withCredentials([string(credentialsId: 'github_token', variable: 'GH_TOKEN')]) {
            sh "echo ${GH_TOKEN} | docker login ghcr.io -u USERNAME --password-stdin"
        }
    }
    stage('Docker Push'){
        sh "docker push ghcr.io/daviddager/spring-cloudcamp/spring:latest"
    }
}