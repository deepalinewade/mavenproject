pipeline
{
agent none
stages
{

stage ('scm checkout')
{ agent { label 'JAVA'} 
  steps {  git branch: 'master', url: 'https://github.com/deepalinewade/mavenproject.git'   }}


stage('code compile')
{ agent { label 'JAVA'}
  steps {withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) 
{
    sh 'mvn compile'   
}} }

stage('execute unit test framework')
{ agent { label 'JAVA'}
  steps {withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true)
{
    sh 'mvn test'   
}} }

stage('code build')
{ agent { label 'JAVA'}
  steps {withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true)
{
    sh 'mvn package'   
}} }

stage('deploy to tomcat dev')
{steps { sshagent (['DEVCICD']) 
  {
    sh 'scp -o StrictHostKeyChecking=no webapp/target/webapp.war ec2-user@172.31.10.155:/usr/share/tomcat/webapps'
  }
}}


//stage('deploy to tomcat qa')
//{steps {   sh 'echo "deploy to tomcat qa" ' }}
    
   

}

}
