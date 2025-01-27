pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nginx"
        CONTAINER_NAME = "nginx_container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/your-username/nginx-app.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh "docker rm -f ${CONTAINER_NAME} || true"

                    // Run the container on port 8080
                    sh "docker run -d --name ${CONTAINER_NAME} -p 9000:80 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            echo 'NGINX app deployed successfully!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
