#!/bin/bash
echo "Downloading checkstyle"
curl -LJO https://github.com/checkstyle/checkstyle/releases/download/checkstyle-9.3/checkstyle-9.3-all.jar

if [${INPUT_STYLFILE} -eq "google"]
then
    echo "Downloading selected Google stylefile"
    curl -LJ -o stylefile.xml https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/google_checks.xml
else
    echo "Downloading selected Sun stylefile"
    curl -LJ -o stylefile.xml https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/sun_checks.xml

chmod +x /app/checkstyle-9.3-all.jar
java -jar checkstyle-9.3-all.jar "${INPUT_WORKDIR}" -c stylefile.xml
