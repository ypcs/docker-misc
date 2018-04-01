FROM ypcs/ubuntu:bionic

RUN /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        curl && \
    /usr/local/sbin/docker-cleanup

RUN /usr/local/sbin/docker-upgrade && \
    curl -fSL "https://atom.io/download/deb" -o "/tmp/atom.deb" && \
    dpkg -i /tmp/atom.deb || true && \
    rm -f /tmp/atom.deb && \
    apt --fix-broken --assume-yes install && \
    /usr/local/sbin/docker-cleanup

