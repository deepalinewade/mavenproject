pipeline
{
agent any
stages
{

stage ('scm checkout')
{steps {  git branch: 'master', url: 'https://github.com/deepalinewade/mavenproject.git'   }}


stage('execute unit test framework')
{steps {withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) 
{
    sh 'mvn test'   // valitade , compile then run test
}} }

stage('generate artifact and store in local maven repository')
{steps {withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true)
{
    sh 'mvn clean install -DskipTests'    //skip test, it also generates artifact, clean the workspace folder
}} }


stage('deploy to tomcat dev')
{steps { sshagent (['DEVCICD']) 
  {
    sh 'scp -o StrictHostKeyChecking=no webapp/target/webapps.war ec2-user@172.31.10.155:/usr/share/webapps'
  } }}


//stage('deploy to tomcat qa')
//{steps {   sh 'echo "deploy to tomcat qa" ' }}
    
   

}

}
