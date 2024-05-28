FROM sbtscala/scala-sbt:eclipse-temurin-17.0.4_1.7.1_3.2.0 as builder
WORKDIR /scala_project
COPY ./scala_items ./
RUN mkdir project
COPY ./project ./project
RUN sbt assembly

FROM openjdk:17
WORKDIR /app
COPY --from=builder /scala_project/target/scala-3.2.0/Hello-assembly-1.0.jar ./
CMD ["java", "-jar", "Hello-assembly-1.0.jar"]
