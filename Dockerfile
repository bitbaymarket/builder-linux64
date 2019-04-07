FROM ubuntu:trusty

RUN apt-get update
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:bitcoin/bitcoin
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update

RUN apt-get install -y libstdc++-7-dev libstdc++6
RUN apt-get install -y libdb4.8 libdb4.8++
RUN apt-get install -y libboost-filesystem1.54.0
RUN apt-get install -y libboost-program-options1.54.0
RUN apt-get install -y libboost-thread1.54.0
RUN apt-get install -y libssl1.0
RUN apt-get install -y libminiupnpc8

