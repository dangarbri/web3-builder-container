# Web3 DevBox
This container is meant to serve as a development environment for web3 applications.

Comes with:
- node version 16.14.0
- yarn
- python3
- build-essential
- vim
- openjdk-8

I have used with projects:
- scaffold-eth
- status-im

## Usage
Build the dockerfile here or pull it from docker hub.

```bash
docker run dangarbri/web3-builder \
 -p 127.0.0.1:3000:3000 \
 -p 127.0.0.1:8545:8545 
```

Port 3000 is the default port for scaffold-eth, you can set it to whatever you want.

Port 8545 is for the local test blockchain, you can leave this out if you don't need it.

You can use the container's root user, or you can use "ubuntu" If using the ubuntu user, you have
to set its password.

```bash
passwd ubuntu
su ubuntu
```

## Why did I make this?
To save space on my mac.

XCode is a pain to work with and takes up so much space.
Without it I can't use brew or do anything useful and
Docker came to save the day.

