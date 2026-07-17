# [PACKAGE] Syncthing
# Synchronizing files in real time between hosts
#
# https://syncthing.net/
# https://wiki.archlinux.org/title/Syncthing

sudo pacman -S --noconfirm --needed syncthing
# enable and start syncthing as a system service
sudo systemctl --user enable --now syncthing.service

# allow syncthing web (port 8384 on tcp) connection on firewall (ufw)
sudo ufw allow 8384/tcp
sudo ufw enable
