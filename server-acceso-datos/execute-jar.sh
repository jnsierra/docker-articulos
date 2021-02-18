sh wait-for-postgres.sh service-postgres12
java -jar -Dspring.profiles.active=$PROFILE_JAR api-acceso-datos.jar 
