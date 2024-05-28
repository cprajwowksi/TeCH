FROM hseeberger/scala-sbt:8u222_1.3.5_2.13.1 as builder

WORKDIR /app

COPY ./main /app/src/main/scala

RUN sbt compile

RUN sbt package

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/scala-2.12/app_2.12-0.1.0-SNAPSHOT.jar /app/hello-world.jar

CMD ["java", "-jar", "hello-world.jar"]