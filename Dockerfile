# Stage 1: Build the application using a Gradle image
FROM gradle:7.5.1-jdk11 AS build
WORKDIR /desktop_app
COPY . .
# Ensure Gradle wrapper has executable permissions
RUN chmod +x gradlew
RUN ./gradlew build --no-daemon

# Stage 2: Create the runtime image
FROM openjdk:11-jdk-slim
WORKDIR /desktop_app
# Copy the built JAR file into the runtime image
COPY --from=build /desktop_app/build/libs/*.jar desktop_app.jar
ENTRYPOINT ["java", "-jar", "desktop_app.jar"]
