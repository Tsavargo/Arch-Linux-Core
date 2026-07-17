sudo pacman -S --noconfirm --needed ufw
sudo systemctl enable ufw
sudo systemctl start ufw

# allow ssh connection
sudo ufw allow ssh
sudo ufw enable
