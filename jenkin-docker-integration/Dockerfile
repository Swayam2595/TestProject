FROM openjdk:8

VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} jenkin-docker-integration.jar

ENTRYPOINT ["java","-jar","/jenkin-docker-integration.jar"]