#!/bin/bash

# removing un-needed packages and apt cache to reduce disk space consumed
apt-get -y autoremove
apt-get -y clean

apt-get purge linux-headers-$(uname -r) build-essential zlib1g-dev libssl-dev libreadline-gplv2-dev

echo "Cleaning up apt cache"
rm -f /etc/apt/apt.conf.d/90aptcache

# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "cleaning up udev rules"
rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules

