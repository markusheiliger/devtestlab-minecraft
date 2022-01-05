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
mkdir /usr/bin/minecraft && unzip minecraft.zip -d /usr/bin/minecraft

cat << EOF > /etc/systemd/system/minecraft.service
[Unit]
Description=Minecraft Service
After=network.target

[Service]
Type=Simple
WorkingDirectory=/bin/minecraft
ExecStart=/bin/sh -c "LD_LIBRARY_PATH=. ./bedrock_server"
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF