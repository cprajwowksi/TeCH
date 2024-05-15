FROM node:14

# Ustawienie katalogu roboczego na /app
WORKDIR /app

# Skopiowanie tylko pliku package.json do kontenera
COPY ./package.json .

# Instalacja zależności
RUN npm install

# Skopiowanie pozostałych plików aplikacji do kontenera
COPY . .

# Wyeksportowanie portu 3000
EXPOSE 3000

# Uruchomienie aplikacji
CMD ["npm", "start"]
