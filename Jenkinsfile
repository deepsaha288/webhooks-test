pipeline {
    agent any

    environment {
        PYTHON_PATH = 'C:\\Users\\ZMO-WIN-DeepS-01\\AppData\\Local\\Microsoft\\WindowsApps\\python3.exe' // update your Python path
    }

    stages {
        stage('Checkout') {  Microsoft\WindowsApps\python3.exe
            steps {
                git url: 'https://github.com/deepsaha288/webhooks-test.git', branch: 'main'
            }
        }

        stage('Run Python Script') {
            steps {
                bat "${env.PYTHON_PATH} detect_changes.py"
            }
        }

        stage('Show Changed Projects') {
            steps {
                script {
                    def changed = readFile('changed_projects.txt').trim()
                    echo "Changed Projects:\n${changed}"
                }
            }
        }
    }
}
