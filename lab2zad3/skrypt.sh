
cat << EOF > Dockerfile

FROM node:16
WORKDIR /opt
COPY ./ ./

RUN apt-get update && apt-get install -y mongodb

RUN npm install
CMD ["npm", "start"]
EOF

docker build -t cprajwowski/lab2zad3 .

docker run cprajwowski/lab2zad3
