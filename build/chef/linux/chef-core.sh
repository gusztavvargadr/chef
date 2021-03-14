#!/bin/sh

apt-get -y update

apt-get -y install locales
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8

apt-get -y install curl
apt-get -y install p7zip-full
