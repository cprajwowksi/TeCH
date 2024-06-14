FROM node:latest as builder
WORKDIR /app
COPY ./app ./ 
RUN npm install

FROM node:alpine
WORKDIR /app
COPY --from=builder ./app ./
CMD ["node", "myapp.js"]

