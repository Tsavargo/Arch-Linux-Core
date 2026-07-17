# [PACKAGE] Ghostty
# Fast, feature-rich terminal emulator
#
# https://ghostty.org/

sudo pacman -S --noconfirm --needed ghostty

# symlink ghostty config into place via GNU stow
cd "$HOME/system/config"
stow -t "$HOME" ghostty
