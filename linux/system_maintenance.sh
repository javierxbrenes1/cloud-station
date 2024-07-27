#!/bin/bash

apt update -y
apt upgrade -y

apt autoremove

du -h

who

ps aux --sort=%cpu | head -5

root@vagrant:/home#