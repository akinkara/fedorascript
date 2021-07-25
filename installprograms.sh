#!/bin/bash
# chmod +x installprograms.sh
echo "script started"

# make updates

dnf upgrade --refresh -y



# enable the RPM Fusion  Free repository, use:

dnf install \

  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y



# Optionally, enable the RPM Fusion Nonfree repository:

dnf install \

  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y



# Install fedy copr repository

dnf copr enable kwizart/fedy -y



# Install fedy

dnf install fedy -y





#bazı paketler içinde snapd gerekir 

dnf install snapd -y 

ln -s /var/lib/snapd/snap /snap



echo "sleeping 20 seconds. because snap dont install packages immediately"

sleep 20



# brave, discord ve notepadqq kur

snap install brave discord 



# vscode, pycharm pro ve datagrip kur

snap install code --classic && snap install pycharm-professional --classic && snap install datagrip --classic



#filezilla ve ekstra programları kur

dnf install filezilla gnome-tweaks htop tlp dconf-editor nodejs postgresql postgresql-server -y



echo "script completed successfully!"
