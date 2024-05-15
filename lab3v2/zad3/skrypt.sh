docker network create my_network

docker run -d --rm --name moj_node --network my_network node:14 sleep 1000

docker run --name moj_nginx --rm -d -p 80:80  --network my_network nginx

docker exec -it moj_nginx openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

docker exec -it moj_nginx mkdir -p /var/cache/nginx
docker cp default.conf moj_nginx:/etc/nginx/conf.d/

docker exec -it moj_nginx nginx -s reload

docker cp myapp.js moj_node:/
docker exec -it moj_node npm install express
docker exec -it moj_node node myapp.js


