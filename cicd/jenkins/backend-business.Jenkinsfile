String urlRepoBack  = "https://github.com/jnsierra/api-article.git"

pipeline {
    agent any
    parameters {
        choice(
            choices: ['SI' , 'NO'],
            description: 'Al encontrarse en si el parametro ejecutara el comando para eliminar las imagenes locales previas al despliegue',
            name: 'BORRAR_IMAGENES'
        )
    }

    stages {
        stage('Clone Repo Front and Backend'){
          steps {
            sh 'mkdir -p build-back'
            dir('build-back'){
                    git branch: 'develop', url: urlRepoBack
            }
          }
        }
        stage('Test'){
            steps{
                echo 'Start Testing...'
                sh '''
                     docker run --rm -v /root/.m2:/root/.m2 -v /volumenes/vol_jenkins/workspace/pipeline-job-backend-business/build-back:/app \
                     -w /app maven:3-openjdk-11 mvn clean install -pl api-business -am
                   '''
                echo 'Finish Testing...'
            }
        }        
        stage('Copy jars'){
          steps{
            echo 'Iniciamos a copiar los artefactos generados'
            sh 'mkdir -p jars'
            sh 'mv build-back/api-business/target/api-business.jar server-business/jar/'	            
            echo 'Finalizamos la copia de los artefactos generados'
          }
        }
        stage('Remove images...'){
             when {
                // Solo ejecuta la eliminacion de imagenes si se envia si
                expression { params.BORRAR_IMAGENES == 'SI' }
            }
            steps{
                script{
                     try {
                        sh 'docker rmi ${IP_REGISTRY}:5000/server-business '
                     } catch (Exception e) {
                      echo 'No fue posible borrar el stack'
                     }
                }
            }
        }
        stage('Tag Images'){
            steps {
                echo 'Ini Tag images...'                
                dir('server-business'){
                    sh 'docker build -t "${IP_REGISTRY}:5000/server-business:latest" .'
                } 
                echo 'Fin Tag images...'
            }
        }
        stage('Push Images'){
            steps {
                echo 'Ini up images registry'
                sh 'docker push ${IP_REGISTRY}:5000/server-business:latest'             
                echo 'Fin up images registry'
            }
        }
        stage('deploy stack'){
            steps{
                sh 'docker stack rm api-service'
                sh 'docker stack deploy -c docker-compose.yml api-service'
            }
        }
   }
}
