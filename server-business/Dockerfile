FROM openjdk:11
ADD jar/api-business.jar /opt/
ADD execute-jar.sh /opt/
WORKDIR /opt/
#USER root
RUN chmod +x execute-jar.sh  
ENTRYPOINT  ["sh","/opt/execute-jar.sh"]
