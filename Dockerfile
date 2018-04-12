FROM ypcs/debian:sid

RUN /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        build-essential \
        devscripts \
        packaging-dev && \
    /usr/local/sbin/docker-cleanup

