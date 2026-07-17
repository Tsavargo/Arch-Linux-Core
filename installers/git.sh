# [PACKAGE] Git
# Distributed version control system
#
# https://git-scm.com/
# https://wiki.archlinux.org/title/Git

sudo pacman -S --noconfirm --needed git

# create env template if it doesn't already exist
SECRETS_FILE="$HOME/system/config/git/.config/fish/conf.d/git-env.fish"
if [[ ! -f "$SECRETS_FILE" ]]; then
	mkdir -p "$(dirname "$SECRETS_FILE")"
	cat > "$SECRETS_FILE" << 'EOF'
# Git identity
# Replace with your name and email
set -gx GIT_USER_NAME "<user-name>"
set -gx GIT_USER_EMAIL "<user-email>"
EOF
	echo "[NOTE] Created $SECRETS_FILE - edit it with your name and email"
fi

# symlink git fish config into place via GNU stow
cd "$HOME/system/config"
stow -t "$HOME" git
