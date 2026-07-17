# [PACKAGE] UFW (Uncomplicated Firewall)
# Simplified frontend for managing firewall rules
#
# https://wiki.archlinux.org/title/Uncomplicated_Firewall

sudo pacman -S --noconfirm --needed ufw
# enable and start ufw as a system service
sudo systemctl enable --now ufw
