FROM ubuntu:20.04

# Environment variables
ENV TZ=US/Eastern
# Setup timezone so installation doesn't ask for geo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt update
RUN apt install -y git make build-essential vim openjdk-8-jdk curl sudo python3
RUN apt install -y libsecret-1-dev
RUN apt install -y python3-pkgconfig
RUN useradd -ms /bin/bash ubuntu
RUN usermod -a -G sudo ubuntu

RUN apt update
RUN apt install wget
RUN mkdir -p /usr/local/node
WORKDIR /usr/local/node
RUN wget https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.xz
RUN tar -xf node-v16.14.0-linux-x64.tar.xz
RUN ln -s /usr/local/node/node-v16.14.0-linux-x64/bin /usr/local/node/bin
RUN ln -s /usr/local/node/node-v16.14.0-linux-x64/include/node /usr/include/node
RUN ln -s /usr/local/node/node-v16.14.0-linux-x64/lib/node_modules /usr/lib/node_modules
RUN mkdir -p /usr/share/nodejs
RUN ln -s /usr/local/node/node-v16.14.0-linux-x64/share/* /usr/share/nodejs

RUN echo PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/node/bin" > /etc/environment

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/node/bin"
RUN npm install -g yarn

EXPOSE 3000
EXPOSE 8545

WORKDIR /home/ubuntu
