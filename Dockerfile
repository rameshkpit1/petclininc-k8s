FROM maven:3.5-jdk-8 as BUILD

COPY . /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package

FROM tomcat:9.0
COPY --from=BUILD /usr/src/myapp/target/petclinic.war /usr/local/tomcat/webapps/

