mkdir nginx_data
echo "zadanie 1" > ./nginx_data/index.html

chmod 777 ./nginx_data/index.html

docker run -p 4000:80 -v $(pwd)/nginx_data:/usr/share/nginx/html nginx
