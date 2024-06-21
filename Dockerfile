FROM amazoncorretto:17-alpine-jdk

COPY build/libs/ .

CMD ["java", "-jar", "springweb-0.0.1-SNAPSHOT.jar"]