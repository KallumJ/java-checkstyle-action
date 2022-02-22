FROM alpine:latest

LABEL description="Java Checkstyle Github Action"

RUN apk update
RUN apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  jq \
  openjdk17-jre-headless

RUN mkdir /target/
COPY * /target/

RUN mkdir /app/

COPY checkstyle-9.3-all.jar /app/checkstyle.jar
COPY sun_checks.xml /app/sun_checks.xml
COPY google_checks.xml /app/google_checks.xml

RUN chmod +x /app/checkstyle.jar
WORKDIR /app/
CMD java -jar checkstyle-9.3-all.jar /target/* -c sun_checks.xml
