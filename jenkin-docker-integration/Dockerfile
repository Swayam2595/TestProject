FROM openjdk:8
ARG JAR_FILE=target/jenkin-docker-integration.jar
WORKDIR D:\Eclipse_Workspace\jenkin-docker-integration
COPY ${JAR_FILE} jenkin-docker-integration.jar
ADD target/jenkin-docker-integration.jar jenkin-docker-integration.jar
ENTRYPOINT ["java","-jar","/jenkin-docker-integration.jar"]