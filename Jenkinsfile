// This Jenkinsfile is meant to be placed in the root directory
// It references and extends the existing Jenkins configuration from the 'jenkins' directory

pipeline {
    agent any
    
    environment {
        // Define environment variables
        DOCKER_IMAGE = 'demo-app'
        DOCKER_TAG = "${env.BUILD_NUMBER}"
        DOCKER_REGISTRY = 'maziliu' // Docker Hub username
        JENKINS_CONFIG_DIR = 'jenkins' // Directory containing existing Jenkins config
    }
    
    stages {
        // Load existing Jenkins configuration if needed
        stage('Load Existing Config') {
            steps {
                script {
                    if (fileExists("${JENKINS_CONFIG_DIR}/Jenkinsfile")) {
                        echo "Found existing Jenkinsfile in ${JENKINS_CONFIG_DIR}"
                        // You can load properties or other configurations here if needed
                        // def existingConfig = load "${JENKINS_CONFIG_DIR}/some-shared-script.groovy"
                    }
                }
            }
        }
        stage('Checkout') {
            steps {
                // Get code from repository
                checkout scm
            }
        }
        
        stage('Build Java Application') {
            steps {
                // Build Java application with Gradle
                // You can replace with Maven if that's what you're using
                sh './gradlew clean build'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile
                sh "docker build -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG} ."
                
                // Tag as latest for convenience
                sh "docker tag ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest"
            }
        }
        
        stage('Run Tests') {
            steps {
                // Run any tests if needed
                echo 'Running tests...'
                // Add your test commands here
            }
        }
        
        stage('Push to Registry') {
            steps {
                // Push the Docker image to registry
                withCredentials([usernamePassword(credentialsId: 'docker-registry-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "echo ${DOCKER_PASSWORD} | docker login ${DOCKER_REGISTRY} -u ${DOCKER_USERNAME} --password-stdin"
                    sh "docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy the application to your environment
                // This is just a placeholder - replace with your actual deployment steps
                echo 'Deploying application...'
                
                // Example: SSH to deployment server and run the new container
                // sshagent(['deployment-server-credentials']) {
                //     sh '''
                //         ssh user@deployment-server "docker pull ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG} && \
                //         docker stop tomcat-container || true && \
                //         docker rm tomcat-container || true && \
                //         docker run -d -p 8080:8080 --name tomcat-container ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}"
                //     '''
                // }
            }
        }
    }
    
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}