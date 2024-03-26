FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

COPY --from=build /target/Real-Time-Chat-App-1.0.jar Real-Time-Chat-App-1.0.jar

ENV PORT=9192

EXPOSE $PORT

CMD ["java", "-jar", "Real-Time-Chat-App-1.0.jar"]