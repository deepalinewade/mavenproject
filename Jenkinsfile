pipeline
{
agent any
stages
{
stage('scm checkout')
{steps { git branch: 'master', url: 'https://github.com/deepalinewade/mavenproject.git'}}

stage('compile the job')   //validate then it compiles so no need to seprately add validation Stage
{steps { withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn compile'} }}

stage('execute unit test framework')   
{steps { withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn test'} }}

stage('build the code')   
{steps { withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn package'} }}

}
}
