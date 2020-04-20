FROM marceloagmelo/maven-3.6.3-openjdk-11:latest AS builder

LABEL maintainer="Marcelo Melo marceloagmelo@gmail.com"

ENV APP_HOME /opt/app

ADD app $APP_HOME

RUN mvn -f $APP_HOME/pom.xml clean package

FROM marceloagmelo/openjdk-11:latest

USER root

ADD scripts $IMAGE_SCRIPTS_HOME
COPY Dockerfile $IMAGE_SCRIPTS_HOME/Dockerfile

RUN chown -R java:java $IMAGE_SCRIPTS_HOME && \
    chown -R java:java $APP_HOME && \
    rm -Rf /tmp/* && rm -Rf /var/tmp/*

COPY --from=builder $APP_HOME/target/java-application-1.0-SNAPSHOT.jar $APP_HOME/java-application-1.0-SNAPSHOT.jar

ENV JAR_PATH $APP_HOME/java-application-1.0-SNAPSHOT.jar

EXPOSE 8080  

USER java

WORKDIR $IMAGE_SCRIPTS_HOME

ENTRYPOINT [ "./control.sh" ]
CMD [ "start" ]