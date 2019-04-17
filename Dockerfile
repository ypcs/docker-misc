FROM ypcs/java:gradle-5.0

ARG APT_PROXY

RUN /usr/lib/docker-helpers/apt-setup && \
    /usr/lib/docker-helpers/apt-upgrade && \
    apt-get --assume-yes install \
        bison \
        build-essential \
        curl \
        flex \
        git \
        jython \
        python3 \
        python3-jpype \
        unzip \
        wget && \
    /usr/lib/docker-helpers/apt-cleanup

RUN adduser --disabled-password --gecos "user,,," user && \
    chgrp user /usr/src && \
    chmod 0775 /usr/src

USER user

RUN mkdir -p /home/user/.gradle/init.d && \
    mkdir -p /home/user/flatRepo

COPY repos.gradle /home/user/.gradle/init.d/repos.gradle

WORKDIR /tmp

RUN curl -fsSLO "https://github.com/pxb1988/dex2jar/releases/download/2.0/dex-tools-2.0.zip" && \
    unzip dex-tools-2.0.zip && \
    mv dex2jar-2.0/lib/dex-*.jar /home/user/flatRepo/ && \
    rm -rf dex-tools-2.0.zip dex2-jar-2.0

WORKDIR /home/user/flatRepo

RUN curl -fsSOL https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/android4me/AXMLPrinter2.jar

WORKDIR /tmp

RUN curl -fslOL https://sourceforge.net/projects/catacombae/files/HFSExplorer/0.21/hfsexplorer-0_21-bin.zip && \
    mkdir hfsx && \
    cd hfsx && \
    unzip ../hfsexplorer-0_21-bin.zip && \
    cd lib && \
    cp csframework.jar hfsx_dmglib.jar hfsx.jar iharder-base64.jar /home/user/flatRepo/ && \
    cd .. && \
    rm -rf hfsx hfsexplorer-0_21-bin.zip

RUN curl -fslOL https://sourceforge.net/projects/yajsw/files/yajsw/yajsw-stable-12.12/yajsw-stable-12.12.zip && \
    mkdir -p /usr/src/ghidra.bin/Ghidra/Features/GhidraServer/ && \
    cp yajsw-stable-12.12.zip /usr/src/ghidra.bin/Ghidra/Features/GhidraServer/ && \
    rm -f yajsw-stable-12.12.zip

WORKDIR /usr/src

RUN git clone https://github.com/NationalSecurityAgency/ghidra

WORKDIR /usr/src/ghidra

RUN gradle yajswDevUnpack

RUN gradle buildGhidra
