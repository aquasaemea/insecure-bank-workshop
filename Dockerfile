FROM gradle:7.3.1-jdk17 AS builder
LABEL maintainer="Hdiv Security"

COPY --chown=gradle:gradle ./log4j-cve-2021-44228 /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle :malicious-server:bootJar --no-daemon

FROM openjdk:8u181-jdk-alpine

RUN mkdir /app
RUN echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' > /eicar.com.txt
RUN chmod +x ./eicar.com.txt
RUN mkdir -p /usr/local/tomcat/

WORKDIR /usr/local/tomcat

WORKDIR /veryMalicious

CMD echo "Hello!"d
