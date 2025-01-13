pipeline {
    agent none  // No default agent for the entire pipeline

    stages {
        stage('scm checkout') {
            agent { label 'JAVA' }  // Using an agent with the label 'JAVA'
            steps {
                git branch: 'master', url: 'https://github.com/deepalinewade/mavenproject.git'
            }
        }

        stage('code compile') {
            agent { label 'JAVA' }  // Using an agent with the label 'JAVA'
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
                    sh 'mvn compile'
                }
            }
        }

        stage('execute unit test framework') {
            agent { label 'JAVA' }  // Using an agent with the label 'JAVA'
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
                    sh 'mvn test'
                }
            }
        }

        stage('code build') {
            agent { label 'JAVA' }  // Using an agent with the label 'JAVA'
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
                    sh 'mvn package'
                }
            }
        }

        stage('deploy to tomcat dev') {
            agent { label 'JAVA' }  // Adding an agent for this stage as well
            steps {
                sshagent(['DEVCICD']) {
                    sh 'scp -o StrictHostKeyChecking=no webapp/target/webapp.war ec2-user@172.31.10.155:/usr/share/tomcat/webapps'
                }
            }
        }

        // stage('deploy to tomcat qa') {
        //     steps {
        //         sh 'echo "deploy to tomcat qa"'
        //     }
        // }
    }
}