#!/bin/bash

# Tworzenie woluminu nginx_data
docker volume create nginx_data

# Uruchamianie kontenera Nginx z zamontowanym woluminem
docker run -d -p 80:80 -v nginx_data:/usr/share/nginx/html --name nginx_container nginx

# Kopiowanie nowej zawartości strony HTML do woluminu
docker cp nowa_zawartosc.html nginx_container:/usr/share/nginx/html/index.html
