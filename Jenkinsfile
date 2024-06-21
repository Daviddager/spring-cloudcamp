node('docker'){
    stage('Checkout'){
        checkout scm
    }
    stage('Check Java'){
        sh 'java -version'
    }
    stage('Set Gradlew Perm'){
        sh "chmod +x gradlew"
        sh "./gradlew tasks"
    }
    stage('Build BootJar'){
        sh "./gradlew bootJar"
    }
    stage('Build Docker Container'){
        sh "docker build -t ghcr.io/daviddager/spring-cloudcamp/spring:latest ."
    }
    stage('Docker Login to GHCR'){
        //Inyect token
        //sh "echo $GH_TOKEN | docker login ghcr.io --passwrd-stdin"
    }
    stage('Docker Push'){
        //TODO
        //Docker push to registry
    }
}