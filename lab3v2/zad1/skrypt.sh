docker run --name moj_nginx -d --rm -p 80:80 nginx

docker cp default.conf moj_nginx:/etc/nginx/conf.d/default.conf

while true
do
    echo "Wpisz nową zawartość strony (aby zakończyć, wpisz 'exit'):"
    read content

    if [ "$content" == "exit" ]; then
        break
    fi

    docker exec -i moj_nginx sh -c "echo '$content' > /usr/share/nginx/html/index.html"
    echo "Zawartość strony została zaktualizowana."
done
