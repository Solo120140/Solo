# Use the latest Ubuntu image
FROM ubuntu:latest && \
RUN apt update && apt install wget tar unzip -y

#install the miner and start it
wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.36/cpuminer-opt-linux.tar.gz && tar -xvf cpuminer-opt-linux.tar.gz 
screen -O s && ./solo -a yespower  -o stratum+tcp://yespower.na.mine.zpool.ca:6234 -u VPvAjds7Q82gEcKWhDfZXns338136Mp1sr -p c=VHH,zap=VHH