pipeline {
    agent any

        environment {
             IMAGE_NAME = "geraldh443/application"
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
                 withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_HUB_USER', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                 sh '''
                    echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USER" --password-stdin
                    docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    echo " Image poussée sur Docker Hub"
                    '''
                                                                          }
                  }
                                     }

          stage('Deploy on VM2 with Ansible') {
             steps {
                  withCredentials([sshUserPrivateKey(credentialsId: 'vm2-ssh-key', keyFileVariable: 'SSH_KEY')]) {
                  sh '''
                     ssh -o StrictHostKeyChecking=no -i $SSH_KEY user@172.18.46.92 '
                     cd /home/cicd &&
                     ansible-playbook -i hosts Deploy.yml                                                          '
                     '''
                   }                                                                                              }
                                               }
        }
}
