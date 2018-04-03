FROM ypcs/debian:stretch

RUN /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        bc \
        dnsutils \
        git && \
    /usr/local/sbin/docker-cleanup

RUN git clone https://github.com/cleanbrowsing/dnsperftest /opt/dnsperftest

CMD ["bash", "/opt/dnsperftest/dnstest.sh"]
