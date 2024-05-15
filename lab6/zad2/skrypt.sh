docker network create --driver bridge my_network
docker run -d --rm --name web -p 3000:3000 --network my_network node:14 sleep 1000
docker run -d --rm --name db -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw  -e MYSQL_ROOT_HOST='%' --network my_network mysql
docker cp Express3.js web:/Express3.js

docker exec -it web npm install mysql2
docker exec -it web npm install express
docker exec -it db mysql -h 172.17.0.2 -P 3306 --protocol=tcp -u root -p
docker exec -it web node Express3.js
