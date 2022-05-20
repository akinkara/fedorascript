#!/bin/bash
# CAUTION this will destroy your current i3 and polybar configs

read -p "CAUTION this will destroy your current i3 and polybar configs and replace with new ones. Do you wish to continue ?(Y/N): " yn 
    case $yn in
        [Yy]* ) echo "doint it!"
                cp -r ./i3 ~/.config
                cp -r ./polybar ~/.config
                chmod +x ~/.config/i3/launch_polybar.sh
                i3-msg reload
                i3-msg restart;; 
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
echo "Done"

