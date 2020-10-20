#!/bin/sh
mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi
exec openvpn /etc/openvpn/server.conf
sleep 10