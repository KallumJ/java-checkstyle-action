#!/bin/bash
echo "Downloading checkstyle"
curl -LJO https://github.com/checkstyle/checkstyle/releases/download/checkstyle-9.3/checkstyle-9.3-all.jar

echo "Downloading selected Sun stylefile"
curl -LJ -o stylefile.xml https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/sun_checks.xml

java -jar checkstyle-9.3-all.jar ./ -c stylefile.xml
