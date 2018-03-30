FROM ypcs/node:latest

RUN \
    /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        bash-completion \
        git \
        less \
        source-highlight \
        vim \
        vim-scripts && \
    /usr/local/sbin/docker-cleanup

RUN \
    npm install -g npx

RUN adduser --disabled-password --gecos "User,,," user

WORKDIR /home/user

USER user
