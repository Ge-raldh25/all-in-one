pipeline {
    agent any

        environment {
             IMAGE_NAME = "geraldh443/app"
             IMAGE_TAG = "latest"
             REPO_URL = "https://github.com/Ge-raldh25/all-in-one.git"
                   }

        stages {
        stage('Clone') {
            steps {
                 sh '''
                    rm -rf all-in-one
                    git clone --branch master ${REPO_URL}
                    '''
                  }
                        }

        stage('Build Docker Image') {
            steps {
                sh '''
                   cd facturation-app
                   docker build -t ${IMAGE_NAME}:${IMAGE_TAG}  -f docfile_html .
                   echo " Image Docker construite : ${IMAGE_NAME}:${IMAGE_TAG}"
                   '''
                   }
                                     }

         stage('Push to Docker Hub') {
            steps {
                 withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_HUB_USER', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                 sh '''
                    echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USER" --password-stdin
                    docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    echo " Image poussée sur Docker Hub"
                    '''
                                                                          }
                  }
                                     }

                                               }
        }
}
