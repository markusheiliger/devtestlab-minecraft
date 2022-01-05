#!/bin/bash

# upgrade & install packages
apt update && apt upgrade -y
apt install -y openjdk-8-jre-headless
apt install -y screen

# open firewall
ufw allow 25565

