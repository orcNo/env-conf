#!/bin/bash

set -e

if [ $UID != 0 ]; then
	exit 0
fi

echo "install proxy conf file..."
cp ./proxy-conf/ss-tproxy.conf /etc/ss-tproxy/
cp ./proxy-conf/config.json /etc/v2ray/
