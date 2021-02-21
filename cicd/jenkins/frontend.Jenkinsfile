String urlRepoFront = "http://192.168.0.30:8929/ud/articulos-web.git"
String ipRegistry = "192.168.0.30"
String gitCredentials = "Git_user"

pipeline {
    agent any
    stages {
        stage('Remove container'){
            steps{
                script{
                    try{
                        sh '''
                            docker stop frontend-art
                        '''
                    }catch(Exception e){
                        echo 'Error al detener contenedor'
                    }
                    try{
                        sh '''
                            docker rm frontend-art
                        '''
                    }catch(Exception e){
                        echo 'Error al eliminar el contendor'
                    }
                }
            }
        }
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
                    sh 'docker build -t "'+ipRegistry+':5000/angular-cli:latest" .'
                    sh 'docker push '+ipRegistry+':5000/angular-cli:latest'
                    sh 'docker rmi '+ipRegistry+':5000/angular-cli:latest'
                }
            }
        
        }
        stage('Deploy'){
            steps{
                sh '''
                    docker run -d -p 5010:80 \
                                    --name frontend-art \
                                     192.168.0.11:5000/angular-cli:latest
                '''
            }
        }
    }
}
