# Halit's Dotfiles

Personal dotfiles and setup scripts for my MacBook and homeserver. Managed through Claude Code.

## Structure

```
dotfiles/
├── configs/
│   ├── .gitconfig          → ~/.gitconfig
│   ├── kitty/              → ~/.config/kitty/
│   │   ├── kitty.conf
│   │   └── font-zoom.sh
│   ├── nvim/               → ~/.config/nvim/
│   │   ├── init.lua
│   │   └── lua/
│   │       ├── core/
│   │       │   ├── options.lua
│   │       │   ├── keymaps.lua
│   │       │   └── autocmds.lua
│   │       └── plugins/
│   │           ├── colorscheme.lua
│   │           ├── treesitter.lua
│   │           ├── lsp.lua
│   │           ├── cmp.lua
│   │           ├── telescope.lua
│   │           ├── neo-tree.lua
│   │           ├── gitsigns.lua
│   │           ├── lualine.lua
│   │           └── ui.lua
│   ├── ssh/                → ~/.ssh/
│   │   ├── config
│   │   └── id_ed25519.pub
│   └── tmux/               → ~/.config/tmux/
│       └── tmux.conf
├── macos/
│   └── hide-default-apps.sh
├── scripts/                # utility scripts (empty)
├── bootstrap.sh            # run on a new machine
├── CLAUDE.md               # context file for Claude Code (symlinked to ~/)
└── README.md
```

## New Machine Setup

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install Claude Code
brew install --cask claude-code

# 3. Clone this repo
git clone <repo-url> ~/Developers/dotfiles

# 4. Run bootstrap
cd ~/Developers/dotfiles && ./bootstrap.sh
```

Bootstrap installs all tools, creates all symlinks, and applies macOS tweaks in one shot.

## Configs

### Neovim
Full IDE setup with lazy.nvim. Plugins: Catppuccin Mocha, Treesitter, LSP (pyright, ts_ls, lua_ls), nvim-cmp, Telescope, neo-tree, gitsigns, lualine, conform.

Formatters managed outside Mason (Homebrew): `black`, `ripgrep`.
Formatters managed by Mason: `prettier`, `stylua`.

Key mappings: see `configs/nvim/lua/core/keymaps.lua`.

### Tmux
Prefix: `Ctrl+Space`. Splits: `prefix v` (vertical), `prefix s` (horizontal). Pane nav: `prefix h/j/k/l`. Minimal status bar using Catppuccin Mocha colours.

### Kitty
Font: SF Mono 16pt. Theme: Terminal.app Clear Dark. Font zoom via `font-zoom.sh` (`Cmd+=`, `Cmd+-`, `Cmd+0`).

## Setup Log

### 2026-02-18 — New MacBook
- Installed Homebrew, Claude Code, gh, Kitty, Chrome, Spotify, VSCode, IntelliJ, Zoom, Neovim, tmux
- Initialized dotfiles repo
- Configured git identity, SSH, CLAUDE.md symlink
- Added Kitty config with font-zoom utility

### 2026-02-18 — Neovim + tmux
- Built full Neovim IDE config (lazy.nvim, LSP, Treesitter, Telescope, Catppuccin)
- Installed Node.js, Python 3.14, black, ripgrep to support Mason tooling
- Built tmux config (Ctrl+Space prefix, vim pane nav, minimal Catppuccin status bar)

### 2026-02-18 — Tailscale
- Installed Tailscale (`brew install --cask tailscale`) — requires sudo, run in interactive terminal

### 2026-02-19 — Homeserver SSH access
- Added `id_ed25519` public key to homeserver (K3s VM root) via Proxmox console: `curl https://github.com/halitdincer.keys >> /root/.ssh/authorized_keys`
- SSH config updated with homeserver host aliases (`homeserver-k3s`, `homeserver-proxmox`, etc.) — all use `id_ed25519`
- Old `homeserver_ed25519` key no longer exists on this machine; GitHub-hosted key is the canonical method going forward

### 2026-02-19 — Homeserver power outage recovery + hardening
- After electric outage, K3s restarted; ArgoCD repo-server, Vault, and external-secrets all needed manual recovery
- Deployed `vault-unsealer` — polls Vault every 30s and auto-unseals after any restart; keys stored as SealedSecret in git
- Bumped K3s VM (105) from 2 cores/4GB to 4 cores/8GB — node was at 100% CPU/memory requests
- Installed `kubeseal` via Homebrew for sealing secrets locally against the cluster's public key
- Added `~/.config/opencode/AGENTS.md → dotfiles/CLAUDE.md` symlink (OpenCode global context)
- Recovery order going forward: 1) restart ArgoCD, 2) restart external-secrets (Vault unseals itself)
- Full procedure in `homeserver-iac/CLAUDE.md` under "Power outage / full cluster restart recovery"
