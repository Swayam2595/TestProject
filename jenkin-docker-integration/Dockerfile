FROM openjdk:8
EXPOSE 8091
ARG JAR_FILE
COPY ${JAR_FILE} jenkin-docker-integration.jar
WORKDIR D:\Eclipse_Workspace\jenkin-docker-integration
ADD target./jenkin-docker-integration.jar jenkin-docker-integration.jar
ENTRYPOINT ["java","-jar","/jenkin-docker-integration.jar"]