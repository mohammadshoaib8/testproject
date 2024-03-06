pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t my-react-app .'
            }
        }
        stage('Test') {
            steps {
                // Add your testing steps here
                sh 'echo "Running tests..."'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
