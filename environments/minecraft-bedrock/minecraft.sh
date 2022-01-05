#!/bin/bash

# switch to script folder
cd $(dirname "$0")

# upgrade packages
apt update && apt upgrade -y

# install packages
apt install -y unzip

# remove packages
apt autoremove

# downloading minecraft bedrock
wget -O minecraft.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.2.03.zip

# unzip minecraft package
mkdir /bin/minecraft && unzip minecraft.zip -d /bin/minecraft