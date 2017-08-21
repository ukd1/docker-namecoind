FROM ubuntu:16.04
MAINTAINER me@rsmith.co

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
        curl \
        build-essential \
        libtool \
        autotools-dev \
        automake \
        pkg-config \
        libssl-dev \
        libevent-dev \
        bsdmainutils \
        libboost-system-dev \
        libboost-filesystem-dev \
        libboost-chrono-dev \
        libboost-program-options-dev \
        libboost-test-dev \
        libboost-thread-dev \
        libdb-dev \
        libdb++-dev

ADD https://github.com/namecoin/namecoin-core/archive/nc0.13.99-name-tab-beta1.tar.gz nc0.13.99-name-tab-beta1.tar.gz
RUN tar xzf nc0.13.99-name-tab-beta1.tar.gz \
    && rm nc0.13.99-name-tab-beta1.tar.gz

RUN cd namecoin-core-nc0.13.99-name-tab-beta1 \
    && export BUILD_P=`cat /proc/cpuinfo | grep processor | wc -l` \
    && ./autogen.sh \
    && ./configure --with-incompatible-bdb \
    && make -j $BUILD_P \
    && make install \
    && mkdir /data

VOLUME ["/data"]
EXPOSE 8336/tcp 8334/tcp
ENTRYPOINT ["/usr/local/bin/namecoind", "-datadir=/data", "-debug", "-rpcbind=0.0.0.0:8336", "-rpcallowip=0.0.0.0/0"]
