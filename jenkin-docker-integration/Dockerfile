FROM openjdk:8
EXPOSE 8091
ADD target/jenkin-docker-integration.jar jenkin-docker-integration.jar
WORKDIR D:\Eclipse_Workspace\jenkin-docker-integration
ENTRYPOINT ["java","-jar","/jenkin-docker-integration.jar"]