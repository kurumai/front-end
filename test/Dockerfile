FROM node:10.21-buster

RUN apt-get update && apt-get install -y make

RUN npm install phantomjs-prebuilt
RUN npm install casperjs

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
