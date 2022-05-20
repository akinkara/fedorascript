#!/bin/bash

# installs pycharm and datagrip
# heavily inspired by fedy pycharm script 
# https://github.com/rpmfusion-infra/fedy/blob/master/plugins/pycharmprofessional.plugin/install.sh


# pycharm
URL=$(wget "https://data.services.jetbrains.com/products/releases?code=PCP&latest=true" -O - | grep -o "https://download.jetbrains.com/python/pycharm-professional-[0-9.]*.tar.gz" | head -n 1)
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

tar -vxzf "$FILE" -C "/opt/"

mv /opt/pycharm* "/opt/pycharm-professional"
ln -sf "/opt/pycharm-professional/bin/pycharm.sh" "/usr/bin/pycharm-professional"

# datagrip
URL=$(wget "https://data.services.jetbrains.com/products/releases?code=DG&latest=true" -O - | grep -o "https://download.jetbrains.com/datagrip/datagrip-[0-9.]*.tar.gz" | head -n 1)
FILE_DG=${URL##*/}

wget -c "$URL" -O "$FILE_DG"

if [[ ! -f "$FILE_DG" ]]; then
	exit 1
fi

tar -vxzf "$FILE_DG" -C "/opt/"

mv /opt/DataGrip* "/opt/datagrip"
ln -sf "/opt/datagrip/bin/datagrip.sh" "/usr/bin/datagrip"