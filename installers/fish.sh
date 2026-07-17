sudo pacman -S fish
chsh -s "$(which fish)"
cd "$HOME/system/config"
stow -t "$HOME" fish
