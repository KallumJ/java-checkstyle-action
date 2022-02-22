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

RUN curl -LJO https://github.com/checkstyle/checkstyle/releases/download/checkstyle-9.3/checkstyle-9.3-all.jar
RUN curl -LJO https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/sun_checks.xml
RUN cp checkstyle-9.3-all.jar /app/
RUN cp sun_checks.xml /app/

RUN chmod +x /app/checkstyle-9.3-all.jar
CMD java -jar /app/checkstyle-9.3-all.jar /target/* -c /app/sun_checks.xml
