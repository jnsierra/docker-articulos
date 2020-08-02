FROM openjdk:8
COPY api.jar /opt/
COPY execute-jar.sh /opt/
WORKDIR /opt/
ENV PROFILE_JAR test
ENTRYPOINT  ["java", "-jar" ,"api.jar"]
