# ubuntu-setup

Ubuntu user setup - get rid of annoying defaults and add useful settings

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/mludvig/ubuntu-setup/master/setup.sh | bash
```

> **Note:** Use the `raw.githubusercontent.com` URL above, not the plain GitHub one.

What it does:
- Installs `git` if not present
- Clones/updates this repo to `/tmp/ubuntu-setup`
- Copies `~/.vimrc` (dark background, autoindent, yaml fix)
- Installs `direnv` via apt if not present
- Adds a managed block to `~/.bashrc`:
  - Extends `$PATH` with `~/.local/bin`
  - Configures the git-prompt (`__git_ps1` with dirty/stash indicators)
  - Hooks `direnv` into bash

Re-running is safe - the `~/.bashrc` block is replaced, not duplicated.

## Extending

To add more setup steps, follow the existing patterns in `install.sh`:

- **New apt package:** guard with `command -v <tool> >/dev/null || sudo apt-get install -y <tool>`
- **New dotfile:** `cp "$SCRIPT_DIR/<file>" "$HOME/.<file>"`
- **New bashrc snippet:** add it inside the `BASHRC_BLOCK` heredoc in `install.sh`
