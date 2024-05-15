docker run -d --rm -p 3000:8080 --name moj_node node:12 sleep 1000
docker cp ./server.js moj_node:/server.js
docker exec moj_node node server.js
