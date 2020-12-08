FROM openjdk:8
EXPOSE 8091
VOLUME /tmp
ADD target/jenkin-docker-integration.jar jenkin-docker-integration.jar
ENTRYPOINT ["java","-jar","/jenkin-docker-integration.jar"]