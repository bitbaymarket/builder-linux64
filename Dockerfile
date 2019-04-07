FROM ubuntu:trusty

RUN apt-get update
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:bitcoin/bitcoin
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update

