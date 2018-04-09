FROM ypcs/debian:buster

RUN /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        arp-scan \
        dnsutils \
        grepcidr \
        scanssh \
        mdns-scan \
        nmap \
        whois \
        zmap && \
    /usr/local/sbin/docker-cleanup
