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
- Installs `~/.bashrc.local` (PATH, git-prompt, direnv hook) and sources it from `~/.bashrc`

Re-running is safe - `~/.bashrc.local` is overwritten, the `source` line is only added once.

## Extending

To add more setup steps, follow the existing patterns in `install.sh`:

- **New apt package:** guard with `command -v <tool> >/dev/null || sudo apt-get install -y <tool>`
- **New dotfile:** `cp "$SCRIPT_DIR/<file>" "$HOME/.<file>"`
- **New bashrc snippet:** add it to `bashrc.local` in the repo
