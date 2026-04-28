#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing ~/.vimrc"
cp "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"

echo "==> Installing direnv"
if ! command -v direnv >/dev/null 2>&1; then
    sudo apt-get install -y direnv
else
    echo "    direnv already installed, skipping"
fi

echo "==> Installing ~/.bashrc.local"
cp "$SCRIPT_DIR/bashrc.local" "$HOME/.bashrc.local"

echo "==> Updating ~/.bashrc"
if ! grep -q 'bashrc.local' "$HOME/.bashrc"; then
    echo '' >> "$HOME/.bashrc"
    echo '[ -f ~/.bashrc.local ] && source ~/.bashrc.local' >> "$HOME/.bashrc"
fi

echo ""
echo "Done. Open a new shell (or 'source ~/.bashrc') to apply changes."
