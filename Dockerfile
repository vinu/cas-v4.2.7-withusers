FROM tomcat:9-jdk8
LABEL maintainer="vinu@xminds.com"
RUN rm -rf /usr/local/tomcat/webapps && mkdir /usr/local/tomcat/webapps
RUN mkdir /app
WORKDIR /app
COPY ./src /app/src
COPY ./mvnw /app/mvnw
COPY ./maven /app/maven
COPY ./etc/cas.properties /etc/cas/cas.properties
COPY ./etc/log4j2.xml /etc/cas/log4j2.xml
COPY ./etc/users.txt /etc/cas/users.txt
COPY ./etc/services /etc/cas/services
COPY ./pom.xml /app/
RUN chmod +x /app/mvnw && /app/mvnw clean package && cp /app/target/cas.war /usr/local/tomcat/webapps/ && rm -rf /root/.m2 && rm -rf /app/target
COPY ./ROOT /usr/local/tomcat/webapps/ROOT