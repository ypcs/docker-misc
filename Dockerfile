FROM ypcs/debian:stretch

RUN /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        curl && \
    /usr/local/sbin/docker-cleanup

RUN /usr/local/sbin/docker-upgrade && \
    curl -fSL "https://atom.io/download/deb" -o "/tmp/atom.deb" && \
    dpkg -i /tmp/atom.deb || true && \
    apt --fix-broken --assume-yes install && \
    rm -f /tmp/atom.deb && \
    /usr/local/sbin/docker-cleanup


RUN /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        less \
        libasound2 \
        libxss1 \
        nano \
        strace && \
    /usr/local/sbin/docker-cleanup

RUN adduser --disabled-password --gecos "User,,," user

USER user
WORKDIR /home/user
