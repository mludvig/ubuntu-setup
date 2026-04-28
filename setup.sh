#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/mludvig/ubuntu-setup.git"
REPO_DIR="/tmp/ubuntu-setup"

if ! command -v git >/dev/null 2>&1; then
    echo "Installing git..."
    sudo apt-get update -q
    sudo apt-get install -y git
fi

if [ -d "$REPO_DIR/.git" ]; then
    echo "Updating repo in $REPO_DIR..."
    git -C "$REPO_DIR" pull --ff-only
else
    echo "Cloning repo to $REPO_DIR..."
    git clone "$REPO_URL" "$REPO_DIR"
fi

exec bash "$REPO_DIR/install.sh"
