# [PACKAGE] Claude Code
# Agentic coding tool for the command line
#
# https://claude.com/product/claude-code

curl -fsSL https://claude.ai/install.sh | bash

# create env template if it doesn't already exist
SECRETS_FILE="$HOME/system/config/claude/.config/fish/conf.d/claude-env.fish"
if [[ ! -f "$SECRETS_FILE" ]]; then
	mkdir -p "$(dirname "$SECRETS_FILE")"
	cat > "$SECRETS_FILE" << 'EOF'
# Claude API authentication
# Replace with your actual API key from https://platform.deepseek.com/api_keys
set -gx ANTHROPIC_AUTH_TOKEN "<api-key>"
EOF
	echo "[NOTE] Created $SECRETS_FILE - edit it with your API key"
fi

# symlink claude fish config into place via GNU stow
cd "$HOME/system/config"
stow -t "$HOME" claude
