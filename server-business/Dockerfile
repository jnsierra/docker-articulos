FROM openjdk:11
ADD jar/api-business.jar /opt/
ADD execute-jar.sh /opt/
ADD wait-for-discovery.sh /opt/
WORKDIR /opt/
#USER root
RUN chmod +x execute-jar.sh  
RUN chmod +x wait-for-discovery.sh
ENTRYPOINT  ["sh","/opt/execute-jar.sh"]
