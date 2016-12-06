#!/usr/bin/env bash

wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list

apt-get update -y
apt-get upgrade -y

locale-gen en_GB.UTF-8

if [ "$1" == "saltmaster" ]
then
        apt-get install -y tree zsh salt-master salt-cloud salt-ssh salt-api salt-syndic python-m2crypto python-mako python-cffi python-cherrypy python-pip python-pygit2 python-libnacl python-mysqldb python-msgpack python-pygit2 python-gnupg python-dulwich vim vim-nox python-dev python3-dev cmake python3-pip
	pip install --upgrade pip3
	pip install ioflo msgpack-pure timelib
	pip3 install
        pip3 install thefuck

        wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
        chsh -s /bin/zsh vagrant

        mkdir ~/workspace
        git clone https://github.com/a-castellano/myconfigs.git ~/workspace/myconfigs

        ln -s ~/workspace/myconfigs/zsh/acastellano.zsh-theme ~/.oh-my-zsh/themes
        rm ~/.zshrc
        ln -s ~/workspace/myconfigs/zsh/.zshrc ~/.zshrc

        ln -s ~/workspace/myconfigs/vim/.vimrc ~/.vimrc
        mkdir -p ~/.vim/bundle

        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall

        echo "127.0.0.1   saltmaster" >> /etc/hosts
        git clone https://github.com/a-castellano/salt.git /srv/salt
        cp /vagrant/files/master /etc/salt/master
        service salt-master restart

        cp /vagrant/files/gitconfig /root/.gitconfig

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
