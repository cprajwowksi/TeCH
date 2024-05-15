#!/bin/bash

# Tworzenie pliku Dockerfile
cat << EOF > Dockerfile
FROM nginx
WORKDIR /usr/share/nginx/html
EOF

# Budowanie obrazu Dockera
docker build -t cprajwowski/lab3zad1 .

# Uruchamianie kontenera z obrazu
docker run -d -p 80:80 --name lab3zad1 cprajwowski/lab3zad1

# Pętla nieskończona do zmiany zawartości strony internetowej
while true
do
    echo "Wpisz nową zawartość strony (aby zakończyć, wpisz 'exit'):"
    read content

    if [ "$content" == "exit" ]; then
        break
    fi

    docker exec -i lab3zad1 sh -c "echo '$content' > index.html"
    echo "Zawartość strony została zaktualizowana."
done
