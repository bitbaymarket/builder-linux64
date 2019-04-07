FROM ubuntu:trusty

RUN apt-get update
RUN apt install -y make
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN add-apt-repository -y ppa:beineri/opt-qt593-trusty 
RUN add-apt-repository -y ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y g++-7
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev
RUN apt-get install -y libboost-filesystem-dev
RUN apt-get install -y libboost-program-options-dev
RUN apt-get install -y libboost-thread-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libminiupnpc-dev
RUN apt-get install -y libgl1-mesa-dev

RUN ln -s /usr/bin/g++-7 /usr/bin/g++
RUN ln -s /usr/bin/gcc-7 /usr/bin/gcc

RUN mkdir -p /mnt
WORKDIR /mnt

RUN gcc -v

RUN apt-get install -y patch
COPY fix_multiprecision.patch /mnt/
RUN cd /usr && patch -p1 < /mnt/fix_multiprecision.patch

RUN apt-get install -y libqrencode-dev
RUN apt-get install -y qt59-meta-minimal
RUN apt-get install -y qt59tools

