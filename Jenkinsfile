pipeline {
    agent any

        environment {
             IMAGE_NAME = "geraldh443/deploy"
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
                   cd all-in-one
                   docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                   echo " Image Docker construite : ${IMAGE_NAME}:${IMAGE_TAG}"
                   '''
                   }
                                     }

         stage('Push to Docker Hub') {
            steps {
                 withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'geraldh443', passwordVariable: '0149Jss.@')]) {
                 sh '''
                    echo "0149Jss.@" | docker login -u "$geraldh443" --password-stdin
                    docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    echo " Image poussée sur Docker Hub"
                    '''
                                                                          }
                  }
                                     }

          stage('Deploy on VM2 with Ansible') {
             steps {
                 sh '''
                    cd all-in-one
                    ansible-playbook -i hosts deploy.yml
                    echo " Déploiement Ansible terminé sur VM2"
                    '''
                   }
                                               }
        }
}

