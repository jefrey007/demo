pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "demo"
        DOCKER_REGISTRY = "docker.io"  
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from your GitHub repo
                git 'https://github.com/jefrey007/demo.git'
            }
        }

        stage('Build with Maven') {
            steps {
                // Build the project using Maven
                script {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    sh 'docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container
                script {
                    sh 'docker run -d --name demo-container $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME'
                }
            }
        }
    }

    post {
        always {
            // Cleanup the Docker container after the build
            script {
                sh 'docker stop demo-container || true'
                sh 'docker rm demo-container || true'
            }
        }
    }
}
