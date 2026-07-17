# [PACKAGE] Fish
# Smart and user-friendly command line shell
#
# https://fishshell.com/
# https://wiki.archlinux.org/title/Fish

sudo pacman -S --noconfirm --needed fish

# change the default shell to fish
chsh -s "$(command -v fish)"

# symlink fish config into place via GNU stow
cd "$HOME/system/config"
stow -t "$HOME" fish
