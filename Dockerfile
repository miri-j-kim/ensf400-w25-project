# Use OpenJDK base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy application JAR file into the container
COPY target/demo.jar demo.jar

# Define entry point for running the application
ENTRYPOINT ["java", "-jar", "demo.jar"]
