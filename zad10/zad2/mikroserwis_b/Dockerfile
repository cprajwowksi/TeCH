FROM node:alpine
WORKDIR app
COPY ./ ./
RUN npm install express axios mongodb
EXPOSE 3000
CMD ["node", "mikroserwis_b.js"]
