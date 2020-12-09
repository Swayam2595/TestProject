FROM openjdk:8
EXPOSE 8091
ARG JAR_FILE
COPY ${JAR_FILE} jenkin-docker-integration.jar
ADD target./jenkin-docker-integration.jar jenkin-docker-integration.jar

FROM openjdk:8
COPY --from=builder dependencies/ ./
COPY --from=builder snapshot-dependencies/ ./
COPY --from=builder spring-boot-loader/ ./
COPY --from=builder application/ ./
ENTRYPOINT ["java","-jar","/jenkin-docker-integration.jar"]