FROM maven:latest AS build

ARG FILE_PATH_ARG
ENV FILE_PATH=$FILE_PATH_ARG

WORKDIR /app

COPY ./pom.xml .

RUN mvn install

COPY src ./src

RUN mvn package

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/AluGames-1.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["sh", "-c", "java -cp app.jar $FILE_PATH"]
