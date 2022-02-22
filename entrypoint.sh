wget -O checkstyle.jar https://github.com/checkstyle/checkstyle/releases/download/checkstyle-9.3/checkstyle-9.3-all.jar
wget -O sun_checks.xml https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/sun_checks.xml
wget -O google_checks.xml https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/google_checks.xml
java -jar checkstyle.jar * -c sun_checks.xml

