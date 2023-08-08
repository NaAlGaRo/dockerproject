FROM ubuntu:20.04
RUN apt update && apt install -y default-jdk maven git
RUN apt-get -y install wget
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.78/* /usr/local/tomcat/

WORKDIR /home/app/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /home/app/boxfuse-sample-java-war-hello && mvn package
RUN cp /home/app/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps

EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run


