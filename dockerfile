FROM ubuntu:16.04
RUN apt-get update && apt install -y default-jdk maven tomcat8 git
WORKDIR  /root
RUN git clone https://github.com/doct15/example-tomcat-war.git
WORKDIR  /root/example-tomcat-war
RUN mvn package
RUN mv /root/example-tomcat-war/target /var/lib/tomcat8/webapps
EXPOSE 8080
CMD service tomcat8 start

FROM ubuntu:16.04
RUN apt-get update && apt install -y openjdk-8-jdk git wget maven
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50-deployer.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.50/* /usr/local/tomcat/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
