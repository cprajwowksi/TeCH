
cat << EOF > Dockerfile

FROM node:14
WORKDIR /opt
COPY ./ ./
RUN npm install
CMD ["npm", "start"]
EOF

docker build -t cprajwowski/lab2zad2 .

docker run -p 3000:8080 cprajwowski/lab2zad2
