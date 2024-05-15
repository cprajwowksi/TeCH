#!/bin/bash

echo "Wpisz port na jakim chciałbyś nasłuchiwać"
read PORT

cat << EOF > new.conf
server {
    listen $PORT;
    listen [::]:$PORT;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
EOF

cat << EOF > Dockerfile
FROM nginx
COPY ./new.conf /etc/nginx/conf.d/
WORKDIR /usr/share/nginx/html
EOF

docker build -t cprajwowski/lab3zad2 .

docker run -d -p $PORT:$PORT --name lab3zad2 cprajwowski/lab3zad2

