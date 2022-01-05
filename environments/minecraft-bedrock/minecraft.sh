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

# create minecraft user
useradd -m -r -d /opt/minecraft minecraft

# unzip minecraft package
mkdir /opt/minecraft && unzip minecraft.zip -d /opt/minecraft

cat << EOF > /etc/systemd/system/minecraft.service
[Unit]
Description=Minecraft Service
After=network.target

[Service]
Type=Simple
User=minecraft
Group=minecraft
WorkingDirectory=/opt/minecraft
ExecStart=/bin/sh -c "LD_LIBRARY_PATH=. ./bedrock_server"
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF