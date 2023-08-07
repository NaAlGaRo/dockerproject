FROM ubuntu:20.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y /usr/local/
EXPOSE 8080
RUN apt install git -y
WORKDIR /home/app/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/app/boxfuse-sample-java-war-hello/
RUN mvn package
WORKDIR /home/app/boxfuse-sample-java-war-hello/target/
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
CMD /usr/local/tomcat9/bin/startup.sh && tail -F /usr/local/tomcat9/bin/logs/catalina.out