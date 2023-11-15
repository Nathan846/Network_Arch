#!/bin/bash

# A script to set up your project environment. In general, should be safe to
# run multiple times. However: this must only be run inside your vagrant VM! We
# include a simple check to ensure you're not doing this, but it's not
# foolproof...
if [ `hostname` != "cs4254-transport" ]; then
    echo 'Cannot execute the current script outside your Vagrant container/VM';
    exit 1
fi

# install some basic prereqs
sudo sh -c '
sed -i "1s/^/127.0.0.1 cs4254-transport \n/" /etc/hosts
apt install -y dos2unix
apt install iproute2 iputils-ping -y
apt install iptables -y
apt install vim sudo -y
apt install python3-pip -y
pip3 install pyyaml
iptables -N TRAFFIC
iptables -I OUTPUT -j TRAFFIC
echo "All installtion done."' 

# Add a symlink for netsim, nettest, and testall
sudo ln -s /cs4254/infra/netsim /usr/local/bin/netsim
sudo ln -s /cs4254/infra/nettest /usr/local/bin/nettest
sudo ln -s /cs4254/infra/testall /usr/local/bin/testall
sudo ln -s /cs4254/infra/congestiontest /usr/local/bin/congestiontest
sudo ln -s /cs4254/infra/congtestall /usr/local/bin/congtestall
netsim
