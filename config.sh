#!/bin/sh

read -p "Nhap router_id: " router_id
opkg install libustream-openssl
opkg install nodogsplash

wget --no-check-certificate https://raw.githubusercontent.com/trngkn/nodogwifi/main/firewall
wget --no-check-certificate https://raw.githubusercontent.com/trngkn/nodogwifi/main/network
wget --no-check-certificate https://raw.githubusercontent.com/trngkn/nodogwifi/main/login.sh
wget --no-check-certificate https://raw.githubusercontent.com/trngkn/nodogwifi/main/nodogsplash
wget --no-check-certificate https://raw.githubusercontent.com/trngkn/nodogwifi/main/wireless
sed -i "s/id123123/$router_id/g" login.sh
chmod +x login.sh

cp -v network firewall nodogsplash wireless /etc/config/
cp  -v login.sh /usr/lib/nodogsplash/
/etc/init.d/nodogsplash restart

echo "SUCCESS!"
