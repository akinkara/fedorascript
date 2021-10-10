#!/bin/bash
# chmod +x installprograms.sh
echo "Started!"

# make updates

dnf upgrade --refresh -y
dnf update -y

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

# enable bibata cursor theme copr repo
sudo dnf -y copr enable peterwu/rendezvous

# enable arc-icon-theme copr repo
dnf copr -y enable user501254/Arc


#ekstra programları kur
dnf install -y filezilla gnome-tweaks htop dconf-editor nodejs postgresql postgresql-server power-profiles-daemon tlp vim bibata-cursor-themes fedy neofetch arc-icon-theme vlc xbindkeys pulseaudio-utils gnome-extensions-app gnome-shell-extension-dash-to-dock

postgresql-setup initdb                  # initialize PG cluster
systemctl start postgresql               # start cluster

# arayüz tema, cursor vs ayarları yap

# set gnome theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# set cursor theme
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'

# set window button layout
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize:' 

# icon theme
gsettings set org.gnome.desktop.interface icon-theme 'Arc'

# middile click action
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'minimize'

# workspaces on every display
gsettings set org.gnome.mutter workspaces-only-on-primary false


# alt tab for every page not every program
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.shell.window-switcher current-workspace-only "false"

# snapper notes
# sudo snapper create --description "snapshot of root to test" # manual snapshot of root
# sudo snapper -c home create --description "snapshot of home after clean install" # manual snapshot of home
echo "Completed Successfully!"
