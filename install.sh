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

echo "==> Updating ~/.bashrc"
# Remove any previously-managed block, then re-append the current one.
sed -i '/# >>> ubuntu-setup >>>/,/# <<< ubuntu-setup <<</d' "$HOME/.bashrc"
cat >> "$HOME/.bashrc" << 'BASHRC_BLOCK'

# >>> ubuntu-setup >>>
# Extend PATH
export PATH=${PATH}:${HOME}/.local/bin

# Set up git-prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1) \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1) \$ '
fi
unset color_prompt force_color_prompt

eval "$(direnv hook bash)"
# <<< ubuntu-setup <<<
BASHRC_BLOCK

echo ""
echo "Done. Open a new shell (or 'source ~/.bashrc') to apply changes."
