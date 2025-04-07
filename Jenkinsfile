pipeline {
    agent any

    environment {
        SONARQUBE_ENV = 'SonarQube' // Match this name with the one in Jenkins global config
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh './gradlew clean build'
            }
        }

        stage('Run Tests') {
            steps {
                sh './gradlew check'
            }
        }

        stage('Static Analysis - SonarQube') {
            steps {
                withSonarQubeEnv("${SONARQUBE_ENV}") {
                    sh './gradlew sonarqube'
                }
            }
        }

        stage('Performance Test - JMeter') {
            steps {
                // Replace with your actual test plan name
                sh 'jmeter -n -t test_plan.jmx -l results.jtl'
            }
        }

        stage('Security Analysis - DependencyCheck') {
            steps {
                sh './gradlew dependencyCheckAnalyze'
            }
        }

        stage('Generate Javadocs') {
            steps {
                sh './gradlew javadoc'
            }
        }

        stage('Deploy App') {
            steps {
                // Deploy the app to run in Codespace
                sh './gradlew apprun &'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
