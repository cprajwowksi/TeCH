
FROM ubuntu AS build
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN npm install express


FROM nginx
COPY --from=build /app /app
COPY default.conf /etc/nginx/conf.d/default.conf 
CMD ["nginx", "-g", "daemon off;"]

 
