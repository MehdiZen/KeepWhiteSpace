# FROM node:18

# WORKDIR /app

# COPY . .

# RUN npm install

# EXPOSE 8080

# CMD [ "node", "server.js"]

FROM httpd:2.4

COPY ./ /usr/local/apache2/htdocs/

EXPOSE 80