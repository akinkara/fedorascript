#!/bin/bash

# chmod +x virtualboxprogram.sh

echo "virtualbox script started"



sudo dnf -y install @development-tools

sudo dnf -y install kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras



cat <<EOF | sudo tee /etc/yum.repos.d/virtualbox.repo 

[virtualbox]

name=Fedora $releasever - $basearch - VirtualBox

baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/34/\$basearch

enabled=1

gpgcheck=1

repo_gpgcheck=1

gpgkey=https://www.virtualbox.org/download/oracle_vbox.asc

EOF



echo "press y when prompted"

sudo dnf search virtualbox



sudo dnf install VirtualBox-6.1



sudo usermod -a -G vboxusers $USER

newgrp vboxusers

id $USER



echo "virtualbox script completed successfully!"
