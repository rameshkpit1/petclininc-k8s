FROM maven:3.6-jdk-11-slim as BUILD
COPY . /src
WORKDIR /src
RUN mvn install -DskipTests

FROM tomcat:9.0-jre8-alpine
COPY --from=BUILD /src/target/petclinic.war /usr/local/tomcat/webapps/spring-framework-petclinic.war

