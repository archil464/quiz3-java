FROM maven:3.8.5-openjdk-11 as maven_build
WORKDIR /tmp
COPY pom.xml .
COPY src ./tmp/src
RUN mvn clean package

FROM eclipse-temurin:11
MAINTAINER ArchilBerikishvili
COPY --from=maven_build /tmp/target/hello-world-0.1.0.jar /data/hello-world-0.1.0.jar
EXPOSE 8080
USER 1002
CMD ["java", "-jar", "/data/hello-world-0.1.0.jar"]
