FROM jenkins/jenkins:lts-jdk11
# switch to root user
USER root
# install docker on top of the base image
RUN apk add --update docker openrc
ENV JAVA_HOME=/opt/java/11.0.14
ENV PATH="${JAVA_HOME}/bin:${PATH}"
