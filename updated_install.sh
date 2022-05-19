# this is not finished
dnf install paketleri

dnf update -y

# activating rpmfusion repos
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf install dkms make kernel-devel dnf-plugins-core
kmod-wl # hp laptop wifi problemini bu driver çözdü

# installing i3 and i3-related packages

dnf install i3 i3status dmenu i3lock xbacklight feh arandr power-profiles-daemon volumeicon lxpolkit picom rofi gnome-terminal polybar nautilus lxappearance lightdm-gtk-greeter-settings gtk-chtheme qt4-qtconfig

# general purpose stuff

dnf install neofetch htop tlp neovim vim catfish xkill xinput xprop mpv keepasxc libreoffice hwinfo git

tlp start
systemctl enable tlp.service

git config --global user.name "Akin Kara"
git config --global user.email "akinkara5006@gmail.com"


# installing python and related packages
dnf install python3-devel python3 python3.9 python3.8 python3-psycopg2 python3-pip
python3.9 -m ensurepip
python3.8 -m ensurepip

# installing docker and docker related packages
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-compose sen
systemctl enable docker
systemctl start docker

# installing brave browser

dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/                        
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc                                  
dnf install brave-browser

# installing vscode

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nena    bled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
check-update
dnf install code


# check if you have ssd 
echo "if 0 congrats you have ssd!"
cat /sys/block/sda/queue/rotational
# pycharm, datagrip  rpm indirip yukle simdilik

# zoom installation
wget https://zoom.us/client/latest/zoom_$(uname -m).rpm -O zoom.rpm
dnf -y install ./zoom.rpm
rm zoom.rpm

# teams installation

dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/ms-teams/
dnf install -y teams

#notlar
#zoomdaki ekran paylasirken kararma sorununu xcompmgr cozuyomus ama ben picom kullanıyorum ikisi aynı anda calismiyor
# dnf install xcompmgr
# xcompmgr -c -l0 -t0 -r0 -o.00