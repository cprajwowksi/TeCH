#!/bin/bash

# Tworzenie katalogów
mkdir node-app
mkdir nginx

# Przechodzenie do katalogu node-app

# Tworzenie pliku package.json
cat << 'EOF' > ./node-app/package.json
{
  "name": "my-node-app",
  "version": "1.0.0",
  "description": "Simple Node.js application",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "author": "Your Name",
  "license": "MIT",
  "dependencies": {
    "express": "^4.17.1"
    // Tutaj możesz dodać inne zależności, które chcesz używać w swojej aplikacji
  }
}
EOF

# Powrót do głównego katalogu

# Tworzenie pliku docker-compose.yml
cat << 'EOF' > docker-compose.yml
version: '3.8'

services:
  node-app:
    build: ./node-app
    ports:
      - "3000:3000"

  nginx:
    build: ./nginx
    ports:
      - "80:80"
    depends_on:
      - node-app
EOF

# Tworzenie pliku Dockerfile dla aplikacji Node.js
cat << 'EOF' > node-app/Dockerfile
FROM node:14

# Ustawienie katalogu roboczego na /app
WORKDIR /app

# Skopiowanie tylko pliku package.json do kontenera
COPY ./package.json .

# Instalacja zależności
RUN npm install

# Skopiowanie pozostałych plików aplikacji do kontenera
COPY . .

# Wyeksportowanie portu 3000
EXPOSE 3000

# Uruchomienie aplikacji
CMD ["npm", "start"]
EOF

# Tworzenie pliku konfiguracyjnego dla Nginx
cat << 'EOF' > nginx/nginx.conf
events {}
http {
    server {
        listen 80;
        server_name localhost;

        location / {
            proxy_pass http://node-app:3000;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade off;
        }
    }
}
EOF

# Tworzenie pliku Dockerfile dla serwera Nginx
cat << 'EOF' > nginx/Dockerfile
FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
EOF

# Tworzenie nowej sieci Docker
docker network create my-network

# Uruchomienie kontenerów za pomocą Docker Compose
docker-compose up -d
