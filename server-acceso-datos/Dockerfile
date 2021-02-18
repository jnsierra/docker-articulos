FROM openjdk:11

ENV PGPASSFILE /opt/pgpass.conf
ADD pgpass.conf /opt/

WORKDIR /opt/ 

RUN chmod 0600 pgpass.conf
RUN apt-get update && \
    apt-get install postgresql 

ADD jar/api-acceso-datos.jar /opt/
ADD execute-jar.sh /opt/



COPY wait-for-postgres.sh /opt/
RUN chmod +x wait-for-postgres.sh
RUN chmod +x execute-jar.sh  

#RUN sh wait-for-postgres.sh service-postgres12
ENTRYPOINT  ["sh","/opt/execute-jar.sh"]
