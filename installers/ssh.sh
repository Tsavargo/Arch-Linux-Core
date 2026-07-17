# [PACKAGE] OpenSSH
# Secure remote login and file transfer
#
# https://www.openssh.org/
# https://wiki.archlinux.org/title/OpenSSH

sudo pacman -S --noconfirm --needed openssh
# enable and start sshd as a system service
sudo systemctl enable --now sshd

# allow ssh (port 22 on tcp) connection on firewall (ufw)
sudo ufw allow ssh
sudo ufw limit ssh
sudo ufw enable
