
cat << EOF > Dockerfile
FROM node:latest
WORKDIR /opt
COPY ./ ./
CMD ["node", "server.js"]
EOF

docker build -t cprajwowski/lab2zad1 .
docker run cprajwowski/lab2zad1

