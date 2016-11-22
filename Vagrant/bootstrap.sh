#!/usr/bin/env bash

apt-get update -y
apt-get upgrade -y

if [ "$1" == "saltmaster" ]
then
        apt-get install -y salt-master python-m2crypto python-mako python-cffi python-cherrypy python-pip python-pygit2 python-libnacl python-mysqldb python-msgpack python-pygit2 python-gnupg python-dulwich
	pip install --upgrade pip
	pip install ioflo msgpack-pure timelib
        echo "127.0.0.1   saltmaster" >> /etc/hosts
        git clone https://github.com/a-castellano/salt.git /srv/salt
        cp /vagrant/files/master /etc/salt/master
        service salt-master restart
else
        apt-get install -y salt-minion
        echo "192.168.50.10   saltmaster" >> /etc/hosts
        cp /vagrant/files/minion /etc/salt/minion
        echo "id: $(uname -n)" >> /etc/salt/minion
        service salt-minion restart
fi

for i in $( seq 1 $2 )
do
        echo "192.168.50.1$i  saltminion$i" >> /etc/hosts
done

locale-gen es_ES.UTF-8
mkdir -p ~/.ssh

cp /vagrant/ssh_keys/$1 ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa
cp /vagrant/ssh_keys/$1.pub ~/.ssh/id_rsa.pub
chmod 755 ~/.ssh/id_rsa.pub

cat /vagrant/ssh_keys/authorized_keys >> ~/.ssh/authorized_keys
