FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
    bash \
    wget \
    openjdk17-jre-headless
# Copies your code file  repository to the filesystem
COPY entrypoint.sh /entrypoint.sh

# change permission to execute the script and
RUN chmod +x /entrypoint.sh

# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]