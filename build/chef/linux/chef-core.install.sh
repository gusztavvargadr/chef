#!/bin/sh
set -e

apt-get -y update

apt-get -y install locales
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8

apt-get -y install curl
