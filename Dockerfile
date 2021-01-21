FROM openjdk:11
COPY /despliegue/jar/api-server-config.jar /opt/
WORKDIR /opt/
ENV PROFILE_JAR test
ENTRYPOINT  ["java", "-jar" , "-Dspring.profiles.active=$profile_jar", "/opt/api-server-config.jar"]
