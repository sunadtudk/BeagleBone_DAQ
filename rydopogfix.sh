sudo dpkg --configure -a && sudo apt-get check -y && sudo apt-get autoremove -y --force-yes && sudo apt-get clean -y --force-yes && sudo rm -rf $HOME/.local/share/Trash/files && sudo rm -rf ~/.evolution/mail/local/folders.db && sudo find ~/.thumbnails -type f -exec rm {} \; && sudo rm -rf /var/log/*.gz && sudo updatedb && sudo apt-get update -y && sudo apt-get upgrade -y --force-yes

