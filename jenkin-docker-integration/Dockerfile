FROM openjdk:8
EXPOSE 8091
ADD target/jenkin-docker-integration.jar jenkin-docker-integration.jar
ARG JAR_FILE=target/jenkin-docker-integration.jar
COPY ${JAR_FILE}jenkin-docker-integration.jar
COPY C:\Windows\System32\config\systemprofile\AppData\Local\Jenkins\.jenkins\workspace\jerkin-docker-integration\Dockerfile
ENTRYPOINT ["java","-jar","/jenkin-docker-integration.jar"]