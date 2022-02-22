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

RUN curl -LJO -o checkstyle.jar https://github.com/checkstyle/checkstyle/releases/download/checkstyle-9.3/checkstyle-9.3-all.jar
RUN wget -O sun_checks.xml https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/sun_checks.xml
# RUN wget -O google_checks.xml https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/google_checks.xml

RUN mkdir /app/

COPY checkstyle.jar /app/checkstyle.jar
COPY sun_checks.xml /app/sun_checks.xml

# COPY google_checks.xml /app/google_checks.xml

RUN chmod +x /app/checkstyle.jar
WORKDIR /app/
CMD java -jar checkstyle.jar /target/* -c sun_checks.xml
