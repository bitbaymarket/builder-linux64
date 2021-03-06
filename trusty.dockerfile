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

RUN apt-get install -y curl
RUN apt-get install -y fuse
RUN chmod 644 /etc/fuse.conf

ENV BASE1 https://github.com/bitbaymarket/bitbay-prebuilt-libs1/releases/download/base1
RUN curl -fsSL -o /usr/bin/linuxdeployqt $BASE1/linuxdeployqt-continuous-x86_64.AppImage
RUN chmod 755 /usr/bin/linuxdeployqt

ENV LD_LIBRARY_PATH "/opt/qt59/lib/x86_64-linux-gnu:/opt/qt59/lib"
ENV PATH "/opt/qt59/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV PKG_CONFIG_PATH "/opt/qt59/lib/pkgconfig"
ENV QTDIR "/opt/qt59"

RUN qmake -v
