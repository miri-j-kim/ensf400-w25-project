#Use an official Tomcat image with JDK 11
FROM tomcat:9.0-jdk11

#Set working directory
WORKDIR /usr/local/tomcat/webapps/

#Copy the built WAR file into Tomcat's webapps directory
COPY build/libs/*.war demo.war

#Expose port 8080
EXPOSE 8080

#Start Tomcat
CMD ["catalina.sh", "run"]
