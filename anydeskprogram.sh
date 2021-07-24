#!/bin/bash
# chmod +x anydeskprogram.sh
echo "anydesk script started"

sudo tee /etc/yum.repos.d/AnyDesk-Fedora.repo <<EOF

[anydesk]

name=AnyDesk Fedora - stable

baseurl=http://rpm.anydesk.com/fedora/x86_64/

gpgcheck=0

repo_gpgcheck=0

gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY

EOF





sudo dnf makecache

sudo dnf install -y redhat-lsb-core anydesk



# if gives an error like nothing provides libpangox-1...



sudo dnf --releasever=32 install pangox-compat.x86_64

sudo dnf install -y anydesk



#anydesk should be installed by now you can check with commands below

systemctl status anydesk.service

systemctl is-enabled anydesk.service

echo "anydesk script completed successfully!"
