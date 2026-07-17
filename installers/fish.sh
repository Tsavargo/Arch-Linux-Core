sudo pacman -S --noconfirm --needed fish
chsh -s "$(which fish)"
cd "$HOME/system/config"
stow -t "$HOME" fish
