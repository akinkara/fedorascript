#!/bin/bash
# chmod +x utilitiesfordevelopment.sh


# install brave

sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install -y brave-browser



# install spotify 

sudo dnf config-manager --set-disabled --repo=fedora-spotify -y &>/dev/null || :

sudo dnf -y install lpf-spotify-client

# ?? usermod -a -G pkg-build akin



# install vscode

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code


# install pycharm MANUALLY 

#download from website and move to a proper location

#create symlink 
# sudo ln -sf "/home/akin/.installedbyme/pycharm-2021.2.2/bin/pycharm.sh" "/usr/bin/pycharm-professional"

#icon stuff
# xdg-icon-resource install --novendor --size 128 "/home/akin/.installedbyme/pycharm-2021.2.2/bin/pycharm.png" "pycharm"
# gtk-update-icon-cache -f -t /usr/share/icons/hicolor

#create .desktop file
: '
cat <<EOF | tee ~/.local/share/applications/pycharm-professional.desktop
[Desktop Entry]
Name=PyCharm Professional
Icon=pycharm
Comment=Python IDE & Django IDE for Web Developers
Exec=pycharm-professional
Terminal=false
Type=Application
StartupNotify=true
Categories=IDE;Development;
Keywords=Jetbrains;python;Django;IDE;
EOF
'

# 