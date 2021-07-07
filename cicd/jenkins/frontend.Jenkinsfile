//String urlRepoFront = "http://192.168.0.30:8929/ud/articulos-web.git"
String gitCredentials = "Git_user"

String urlRepoFront = "https://github.com/jnsierra/articulos-web.git"

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
                    //git branch: 'master', url: urlRepoFront, credentialsId: gitCredentials
                    git branch: 'master', url: urlRepoFront
                }
            }
        }
        stage('Build'){
            steps{
                dir('build-front'){
                    sh 'docker build -t "${IP_REGISTRY}:5000/angular-cli:latest" .'
                }
            }
        
        }
        stage('Deploy'){
            steps{
                sh '''
                    docker run -d -p 5010:80 \
                              --name frontend-art \
                                ${IP_REGISTRY}:5000/angular-cli:latest
                '''
            }
        }
    }
}
