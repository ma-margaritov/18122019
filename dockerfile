FROM ubuntu:16.04
RUN apt-get update && apt install -y default-jdk maven tomcat8 nginx
CMD git clone https://github.com/doct15/example-tomcat-war.git
CMD cd /root/example-tomcat-war && mvn package
CMD mv /root/example-tomcat-war/target /var/lib/tomcat8/webapps
EXPOSE 8080

