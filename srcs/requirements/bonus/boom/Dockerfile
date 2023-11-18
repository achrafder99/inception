FROM debian:bullseye

WORKDIR /app

RUN apt-get update && apt-get install nodejs -y

RUN apt-get install npm -y

COPY ./app/public /app/public

COPY ./app/src /app/src

COPY ./app/package.json /app/

RUN npm install

CMD [ "npm", "start" ]