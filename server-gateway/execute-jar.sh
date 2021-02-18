sh wait-for-discovery.sh 192.168.0.15
java -jar -Dspring.profiles.active=$PROFILE_JAR api-gateway.jar 
