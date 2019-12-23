FROM ubuntu:16.04
RUN apt-get update && apt install -y default-jdk maven tomcat8 git
WORKDIR  /root
RUN git clone https://github.com/doct15/example-tomcat-war.git
WORKDIR  /root/example-tomcat-war
RUN mvn package
RUN mv /root/example-tomcat-war/target /var/lib/tomcat8/webapps
CMD service tomcat8 start
EXPOSE 8080


