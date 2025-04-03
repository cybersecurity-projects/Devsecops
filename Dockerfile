# FROM openjdk:8-jdk-alpine
# WORKDIR /opt/app
# COPY target/wezvatech-demo-9739110917.jar app.jar
# ENTRYPOINT ["java","-jar","app.jar"]

# Stage 1: Build the Java application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -Dmaven.test.skip=true

# Stage 2: Run the application using a minimal JDK image
FROM openjdk:8-jdk-alpine
WORKDIR /opt/app
COPY target/wezvatech-demo-9739110917.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
