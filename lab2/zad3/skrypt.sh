docker run --rm -d -p  2717:27017  --name moj_mongo mongo
docker run --rm -d -p 3000:3000 --name moj_node node:16 sleep 1000
docker exec -it moj_node mkdir app
docker exec -it moj_node sh -c "cd /app && npm install express mongodb"
docker cp Express.js moj_node:/app/Express.js
docker exec -it moj_node sh -c "cd /app && node Express.js"
