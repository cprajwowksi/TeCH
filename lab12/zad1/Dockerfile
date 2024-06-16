FROM node:latest
WORKDIR /app
COPY ./ ./
RUN npm install express
EXPOSE 3000
CMD ["node", "rest.js"]
HEALTHCHECK NONE