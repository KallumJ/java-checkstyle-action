#!/bin/bash
echo "Running"
curl -LJO https://github.com/checkstyle/checkstyle/releases/download/checkstyle-9.3/checkstyle-9.3-all.jar
curl -LJO https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/sun_checks.xml
chmod +x /app/checkstyle-9.3-all.jar
java -jar checkstyle-9.3-all.jar "${INPUT_WORKDIR}" -c sun_checks.xml
