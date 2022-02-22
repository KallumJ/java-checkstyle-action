FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
    bash \
    wget \
    git \
    openjdk17-jre-headless

RUN git clone https://github.com/KallumJ/java-checkstyle-action.git
RUN echo "test"

