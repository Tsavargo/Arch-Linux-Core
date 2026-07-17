# [PACKAGE] Zed
# High-performance, minimal code editor
#
# https://zed.dev/

sudo pacman -S --noconfirm --needed zed

# symlink zed config into place via GNU stow
cd "$HOME/system/config"
stow -t "$HOME" zed
