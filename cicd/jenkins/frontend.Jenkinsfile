String urlRepoFront = "http://192.168.0.20:8929/articulos/articulos-web.git"
String ipRegistry = "192.168.0.11"
String gitCredentials = "Git_user"

pipeline {
    agent any
    stages {
        stage('Clone Repo'){
            steps{
                sh 'mkdir -p build-front'
                dir('build-front'){
                    git branch: 'master', url: urlRepoFront, credentialsId: gitCredentials
                }
            }
        }
        stage('Build'){
            steps{
                dir('build-front'){
                    sh '''
                        docker build -t "192.168.0.11:5000/angular-cli:latest" .
                    '''
                    sh '''
                        docker push 192.168.0.11:5000/angular-cli:latest
                    '''
                    sh '''
                        docker rmi 192.168.0.11:5000/angular-cli:latest
                    '''
                }
            }
        
        }
        stage('Deploy'){
            steps{
                sh '''
                    docker run -d -p 5010:80 192.168.0.11:5000/angular-cli:latest
                '''
            }
        }
    }
}
