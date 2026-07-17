sudo pacman -S --noconfirm --needed ghostty
cd "$HOME/system/config"
stow -t "$HOME" ghostty
