pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clean workspace and checkout code from GitHub
                cleanWs()
                git url: 'https://github.com/sayantanenator/social-book.git', credentialsId: 'your_github_credentials_id'
            }
        }

        stage('Build') {
            steps {
                // Install dependencies and build the Django app
                sh 'pip install -r requirements.txt'
                sh 'python manage.py collectstatic --noinput'
            }
        }

        stage('Test') {
            steps {
                // Run tests for the Django app
                sh 'python manage.py test'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image for your Django app
                sh 'docker build -t your_docker_image_name .'
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to your Docker registry (if needed)
                withCredentials([usernamePassword(credentialsId: 'your_docker_registry_credentials_id', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                }
                sh 'docker push your_docker_image_name'
            }
        }

        stage('Deploy') {
            steps {
                // Use a tool like Kubernetes to deploy the Docker image
                // Or use Docker Compose to deploy the app locally
                // Modify this step based on your deployment environment
            }
        }
    }
}
