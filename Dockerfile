FROM node:14.15.2

WORKDIR /var/www/app/

RUN apt-get update && apt-get update --fix-missing && apt-get install -y \
    nginx \
    nano

RUN mkdir -p /var/www/app/

ADD package*.json /var/www/app/

RUN yarn install

COPY . /var/www/app/

RUN yarn build

COPY ./nginx/default.conf /etc/nginx/sites-available/default

RUN service nginx restart