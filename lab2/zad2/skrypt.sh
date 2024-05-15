docker run -d -p 3000:8080 --name moj_node node:14 sleep 1000
docker cp Express.js moj_node:/Express.js
docker exec -it moj_node npm install express
docker exec -it moj_node node Express.js
