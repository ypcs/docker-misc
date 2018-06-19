FROM ypcs/debian:buster

RUN /usr/lib/docker-helpers/apt-setup && \
    /usr/lib/docker-helpers/apt-upgrade && \
    /usr/lib/docker-helpers/apt-cleanup

RUN /usr/lib/docker-helpers/apt-setup && \
    apt-get --assume-yes install \
        build-essential \
        cargo \
        git \
        libasound2-dev \
        libdbus-1-dev \
        libpulse-dev \
        libssl-dev \
        openssl \
        pkg-config \
        portaudio19-dev \
        rustc && \
    cd /usr/src && \
    git clone https://github.com/Spotifyd/spotifyd && \
    cd spotifyd && \
    cargo build --release --features pulseaudio_backend && \
    cp target/release/spotifyd /usr/local/bin/spotifyd && \
    cd .. && \
    rm -rf spotifyd && \
    apt-get --assume-yes --purge remove \
        build-essential \
        cargo \
        git \
        libasound2-dev \
        libdbus-1-dev \
        libpulse-dev \
        libssl-dev \
        openssl \
        pkg-config \
        portaudio19-dev \
        rustc && \
    /usr/lib/docker-helpers/apt-cleanup
