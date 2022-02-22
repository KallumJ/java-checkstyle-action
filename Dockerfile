FROM alpine:latest

LABEL description="Java Checkstyle Github Action"

RUN adduser -u 2048 /bin/sh -D user

RUN apk update
RUN apk add --no-cache \
    wget \
    openjdk17-jre-headless

# Copies your code file  repository to the filesystem
RUN mkdir /opt/checkstyle
RUN chown user /opt/checkstyle

COPY entrypoint.sh /opt/checkstyle/entrypoint.sh

# file to execute when the docker container starts up
USER user
CMD ./opt/checkstyle/entrypoint.sh