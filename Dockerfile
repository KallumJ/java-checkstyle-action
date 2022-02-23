FROM alpine:latest

LABEL description="Java Checkstyle Github Action"

# Get required packages
RUN apk update
RUN apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  openjdk17-jre-headless

# Create a directory to run in
RUN mkdir /app/

# Copy script from repo into container
COPY entrypoint.sh /app/

# Make it executable
RUN chmod +x /app/entrypoint.sh

# Set the working directory to the app folder
WORKDIR /app/

# Start the container by running the script
ENTRYPOINT [ "/app/entrypoint.sh" ]
