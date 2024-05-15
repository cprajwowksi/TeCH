docker volume create nodejs_data
docker run --name nodzik -d -v nodejs_data:/app node touch /app/pliczek

docker volume create all_volumes

docker run --rm -d -v nginx_data:/plikinginx -v all_volumes:/smiecisko nginx cp -r ./plikinginx /smiecisko

docker run -d -v nodejs_data:/plikinode -v all_volumes:/smiecisko node cp -r ./plikinode /smiecisko
