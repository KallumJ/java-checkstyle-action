FROM alpine:latest

LABEL description="Java Checkstyle Github Action"

RUN apk update
RUN apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  jq \
  openjdk17-jre-headless

RUN mkdir /app/
COPY entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh
WORKDIR /app/
ENTRYPOINT [ "/app/entrypoint.sh" ]
