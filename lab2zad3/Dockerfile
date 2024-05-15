
FROM node:16
WORKDIR /opt
COPY ./ ./

RUN apt-get update && apt-get install -y mongodb

RUN npm install
CMD ["npm", "start"]
