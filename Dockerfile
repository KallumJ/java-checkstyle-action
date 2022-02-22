FROM alpine:latest

RUN apk add --no-cache \
    bash \
    wget \
    default-jdk

COPY action.sh /action.sh

RUN chmod +x /action.sh

ENTRYPOINT [ "action.sh" ]
