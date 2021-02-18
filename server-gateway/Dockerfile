FROM openjdk:11
ADD jar/api-gateway.jar /opt/
ADD wait-for-discovery.sh /opt/
ADD execute-jar.sh /opt/
WORKDIR /opt/
#USER root
RUN chmod +x execute-jar.sh  
RUN chmod +x wait-for-discovery.sh
#CMD sh wait-for-discovery.sh server-discovery
CMD sh wait-for-discovery.sh 192.168.0.15
ENTRYPOINT  ["sh","/opt/execute-jar.sh"]
