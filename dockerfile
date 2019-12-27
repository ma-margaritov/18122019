#FROM ubuntu:16.04
#RUN apt-get update && apt install -y default-jdk maven tomcat8 git
#WORKDIR  /root
#RUN git clone https://github.com/doct15/example-tomcat-war.git
#WORKDIR  /root/example-tomcat-war
#RUN mvn package
#RUN mv /root/example-tomcat-war/target /var/lib/tomcat8/webapps
#EXPOSE 8080
#CMD service tomcat8 start

#FROM ubuntu:16.04
#RUN apt-get update && apt install -y git
#RUN git clone https://github.com/docker-library/tomcat.git
#RUN mkdir /usr/local/tomcat
#RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz -O /tmp/tomcat.tar.gz
#RUN cd /tmp && tar xvfz tomcat.tar.gz
#RUN cp -Rv /tmp/apache-tomcat-8.5.40/* /usr/local/tomcat/
FROM tomcat:8.0
RUN apt-get update && apt install -y git maven
WORKDIR /root
RUN git clone https://github.com/doct15/example-tomcat-war.git 
WORKDIR /root/example-tomcat-war
RUN mvn package
RUN cp /root/example-tomcat-war/target/SimpleTomcatWebApp.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]

