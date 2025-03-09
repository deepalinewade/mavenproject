#deploy application tomcat jboss weblogic windowsiis
FROM tomcat:jdk21

LABEL author=dipa
ENV APPPORT 8080
ENV DESTPATH /usr/local/tomcat/webapps/

#RUN>>>>>base image has jdk so no need to download jdk

#COPY sample.war /usr/local/tomcat/webapp/   or
#COPY webapp/target/webapp.war $DESTPATH
COPY target/webapp.war $DESTPATH
EXPOSE $APPPORT
CMD ["catalina.sh", "run"]
