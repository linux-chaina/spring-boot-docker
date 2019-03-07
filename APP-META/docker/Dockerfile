FROM openjdk:8-jdk-alpine
VOLUME /tmp
ENV LANG en_US.UTF-8
ENV JAVA_OPTS ''
ADD docker-server.jar app.jar
CMD java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTS -jar app.jar
