#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG="$SCRIPT_DIR/packages.conf"
INSTALLERS="$SCRIPT_DIR/installers"

parse_group() {
    awk -v grp="$1" '
        $0 ~ "^\\[" { in_group = ($0 == "[" grp "]") }
        in_group && $0 !~ "^\\[" && $0 !~ "^#" && NF { print $0 }
    ' "$CONFIG"
}

parse_all() {
    awk '
        $0 ~ "^\\[" { in_group = 1; next }
        in_group && $0 !~ "^#" && NF && !seen[$0]++ { print $0 }
    ' "$CONFIG"
}

list_groups() {
    awk '/^\[.*\]$/ { print substr($0, 2, length($0)-2) }' "$CONFIG"
}

ARG="${1:-}"

# Determine mode:
# - every package,
# - one group of packages,
# - single installer
if [[ -z "$ARG" ]]; then
    INSTALLERS_LIST=$(parse_all)
    LABEL="every package"
elif list_groups | grep -qFx "$ARG"; then
    INSTALLERS_LIST=$(parse_group "$ARG")
    LABEL="$ARG packageS"
elif [[ -f "$INSTALLERS/$ARG.sh" ]]; then
    INSTALLERS_LIST="$ARG"
    LABEL="$ARG package"
else
    echo "Usage: ./install.sh [<group>|<installer>]"
    echo "Available groups:"
    list_groups | while read -r group; do echo "  $group"; done
    echo "Available installers:"
    ls "$INSTALLERS"/*.sh 2>/dev/null | while read -r f; do echo "  $(basename "$f" .sh)"; done
    exit 1
fi

if [[ -z "$INSTALLERS_LIST" ]]; then
    echo "Nothing to install."
    exit 0
fi

declare -a PASSED=()
declare -a FAILED=()
declare -a SKIPPED=()

echo "Running: $LABEL..."

while read -r name; do
    SCRIPT="$INSTALLERS/$name.sh"
    echo
    echo "Install: $name..."

    if [[ ! -f "$SCRIPT" ]]; then
        echo "[SKIP] $SCRIPT not found"
        SKIPPED+=("$name")
        continue
    fi

    if [[ ! -x "$SCRIPT" ]]; then
        echo "[SKIP] $SCRIPT not executable"
        SKIPPED+=("$name")
        continue
    fi

    if bash "$SCRIPT" < /dev/null; then
        echo "[PASS] $name"
        PASSED+=("$name")
    else
        echo "[FAIL] $name (exit code: $?)"
        FAILED+=("$name")
    fi
done <<< "$INSTALLERS_LIST"

echo
echo "Summary: $LABEL"
echo "  Passed:  ${#PASSED[@]} ${PASSED[*]:-none}"
echo "  Failed:  ${#FAILED[@]} ${FAILED[*]:-none}"
echo "  Skipped: ${#SKIPPED[@]} ${SKIPPED[*]:-none}"

[[ ${#FAILED[@]} -eq 0 ]] && exit 0 || exit 1
