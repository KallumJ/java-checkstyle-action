FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
    bash \
    wget \
    openjdk17-jre-headless

COPY action.sh /action.sh

RUN chmod +x /action.sh

ENTRYPOINT "action.sh"
