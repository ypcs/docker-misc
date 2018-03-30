FROM ypcs/node:latest

RUN \
    npm install -g npx

RUN adduser --disabled-password --gecos "User,,," user

WORKDIR /home/user

USER user
