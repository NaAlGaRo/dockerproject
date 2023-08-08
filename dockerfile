FROM ubuntu:20.04
RUN apt update
WORKDIR /usr/local/
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN apt install git -y
WORKDIR /home/app/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/app/boxfuse-sample-java-war-hello/
RUN mvn package
WORKDIR /home/app/boxfuse-sample-java-war-hello/target/
COPY hello-1.0.war /usr/local/tomcat9/webapps/
WORKDIR /usr/local/tomcat9/bin/
EXPOSE 8080
CMD ["catalina.sh", "run"]


