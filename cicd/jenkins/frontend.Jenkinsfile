String urlRepoFront = "http://192.168.0.20:8929/articulos/articulos-web.git"
String ipRegistry = "192.168.0.11"

pipeline {
    agent any
    stages {
        stage('Clone Repo'){
            steps{
                sh 'mkdir -p build-front'
                dir('build-front'){
                    git branch: 'master', url: urlRepoFront
                }
            }
        }
    }
}
