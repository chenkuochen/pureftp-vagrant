#!/usr/bin/env bash

apt-get update
apt-get dist-upgrade -y

/sbin/blockdev --setra 2048 /dev/sda
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap sw 0 0" >> /etc/fstab

apt-get install -y make ntp sysstat pstack
apt-get install -y pure-ftpd pureadmin
sudo groupadd ftpgroup
sudo useradd -g ftpgroup -d /dev/null -s /etc ftpuser
sudo mkdir /home/ftpusers
sudo mkdir /home/ftpusers/user1
(echo q; echo q) | sudo pure-pw useradd user1 -u ftpuser -d /home/ftpusers/user1
sudo pure-pw mkdb
sudo ln -s /etc/pure-ftpd/pureftpd.passwd /etc/pureftpd.passwd
sudo ln -s /etc/pure-ftpd/pureftpd.pdb /etc/pureftpd.pdb
sudo ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/50PureDB
sudo chown -hR ftpuser:ftpgroup /home/ftpusers/
sudo /etc/init.d/pure-ftpd restart
