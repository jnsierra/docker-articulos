FROM node:latest as node
WORKDIR /app
COPY /volumenes/vol_jenkins/workspace/pipeline-job/build-front/ /app/
RUN npm install 
RUN npm run build --prod
