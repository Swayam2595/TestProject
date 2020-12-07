FROM openjdk:8
EXPOSE 8091
ADD target/jenkin-docker-integration.jar jenkin-docker-integration.jar

ARG JAR_FILE
COPY ${JAR_FILE} jenkin-docker-integration.jar

ENTRYPOINT ["java","-jar","/jenkin-docker-integration.jar"]