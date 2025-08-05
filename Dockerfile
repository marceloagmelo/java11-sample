FROM maven:3.8.3-openjdk-11 as build

LABEL maintainer="Marcelo Melo marceloagmelo@gmail.com"

WORKDIR /app

# Create a first layer to cache the "Maven World" in the local repository.
# Incremental docker builds will always resume after that, unless you update
# the pom
ADD ./app/pom.xml .
ADD ./app/src ./src/

RUN mvn package -DskipTests

# Do the Maven build!
# Incremental docker builds will resume here when you change sources
# ADD src src
# RUN mvn package -DskipTests
# RUN echo "done!"

# 2nd stage, build the runtime image
FROM openjdk:11-jdk

WORKDIR /app

# Copy the binary built in the 1st stage
COPY --from=build /app/target/java-application-1.0-SNAPSHOT.jar ./

CMD ["java", "-jar", "-XX:+PrintFlagsFinal", "-Xmx256m", "-Xms256m", "java-application-1.0-SNAPSHOT.jar"]

EXPOSE 8080