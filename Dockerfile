FROM tomcat:9.0
WORKDIR /usr/local/tomcat/webapps/
COPY build/libs/ensf400-w25-project-1.0.0.war demo.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
