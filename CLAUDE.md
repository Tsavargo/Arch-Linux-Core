# Project: Dotfiles

Automated Arch Linux setup using a modular installer framework and GNU Stow for configuration management.

## Adding a new installer

When asked to add a new package, follow these steps in order:

### 1. Write the installer script

Create `installers/<name>.sh` with this template:

```bash
# [PACKAGE] <Human-Readable Name>
# <One-line description of what it does>
#
# <Optional URL to project homepage>

# ... installation commands (pacman, curl, etc.) ...

# symlink config into place via GNU stow (if the package has config files)
cd "$HOME/system/config"
stow -t "$HOME" <name>
```

- The `[PACKAGE]` header comment is required - `install.sh` uses it for summary output
- Make the script executable (`chmod +x`)
- If the package has no config files, skip the stow step
- If the package needs secrets (API keys, tokens), create a template file in the installer:

```bash
# create env template if it doesn't already exist
SECRETS_FILE="$HOME/system/config/<name>/.config/fish/conf.d/<name>-env.fish"
if [[ ! -f "$SECRETS_FILE" ]]; then
    mkdir -p "$(dirname "$SECRETS_FILE")"
    cat > "$SECRETS_FILE" << 'EOF'
# <Description of what to fill in>
set -gx <VARNAME> "<placeholder>"
EOF
    echo "[NOTE] Created $SECRETS_FILE - edit it with your <description>"
fi
```

### 2. Create the stow config directory (if needed)

Create `config/<name>/` mirroring the target filesystem. For example, a fish config file at `~/.config/fish/conf.d/<name>.fish` goes in:

```
config/<name>/.config/fish/conf.d/<name>.fish
```

### 3. Add to packages.conf

Add `<name>` to the appropriate existing group, or create a new group if none fit. Groups are defined as `[groupname]` followed by package names, one per line. Blank lines separate groups.

Current groups:
- `[terminal]` - shell, terminal emulator, and fonts
- `[tools]` - core system utilities (ssh, firewall, stow)
- `[sync]` - file synchronization
- `[developer]` - dev tools and CLI utilities
- `[media]` - media playback

Create a new group when the package doesn't logically belong to any existing one. Pick a short, descriptive group name.

### 4. Update README.md

- Add the new package to the **Packages** table under its group
- If a new group was created, add a new row to the table
