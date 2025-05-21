pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/deepsaha288/webhooks-test.git', branch: 'main'
            }
        }

        stage('Detect Changed Projects') {
            steps {
                script {
                    // Run git diff and get changed files between last two commits
                    def diffOutput = bat(returnStdout: true, script: '''
                        git diff --name-only HEAD~1 HEAD
                    ''')

                    // Split output lines and extract top-level directory/project names
                    def projects = diffOutput.readLines()
                        .findAll { it.trim() != '' }
                        .collect { it.split('/')[0] }
                        .unique()

                    // Print the changed projects
                    echo "Changed projects:\n${projects.join('\\n')}"

                    // Optionally save to file
                    writeFile file: 'changed_projects.txt', text: projects.join('\n')
                }
            }
        }

        stage('Show Changed Projects') {
            steps {
                script {
                    def changed = readFile('changed_projects.txt').trim()
                    echo "Changed Projects from file:\n${changed}"
                }
            }
        }
    }
}
