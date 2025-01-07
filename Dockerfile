# Use an official Maven image to build the project
FROM maven:3.8.4-openjdk-11 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY . /app

# Build the application with Maven
RUN mvn clean package

# Use an official OpenJDK image to run the application
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=builder /app/target/demo-1.0-SNAPSHOT.jar /app/demo.jar

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "demo.jar"]
