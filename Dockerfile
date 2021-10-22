FROM node:alpine as builder
WORKDIR /var/www/html

COPY package.json /var/www/html/
RUN npm install
COPY . /var/www/html/

RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /var/www/html/build  /usr/share/nginx/html