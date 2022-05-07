FROM maven:3.6-jdk-11-slim as BUILD
COPY . /src
WORKDIR /src
RUN mvn install -DskipTests

FROM tomcat:9.0
COPY --from=BUILD /usr/src/myapp/target/petclinic.war /usr/local/tomcat/webapps/

