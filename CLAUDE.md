# Halit's Setup — Claude Context

## Who I Am
- Name: Halit Dincer
- Managing personal projects, a homeserver, and a full dev environment through Claude
- This is a new MacBook (Apple Silicon, macOS 15, setup started Feb 2026)

## Current Machine
- **Host:** MacBook (Apple Silicon)
- **Shell:** zsh
- **Package manager:** Homebrew (`/opt/homebrew`)

## Installed So Far (New Laptop)
- Homebrew
- Claude Code (via `brew install --cask claude-code`)
- gh CLI (via `brew install gh`)
- Kitty terminal (via `brew install --cask kitty`)
- Google Chrome (via `brew install --cask google-chrome`)
- Spotify (via `brew install --cask spotify`)
- VSCode (via `brew install --cask visual-studio-code`)
- IntelliJ IDEA Ultimate (via `brew install --cask intellij-idea`)
- Zoom (via `brew install --cask zoom`) — needs manual install, requires sudo
- WhatsApp (via `brew install --cask whatsapp`)
- Neovim (via `brew install neovim`)
- Tmux (via `brew install tmux`)
- Node.js (via `brew install node`)
- Python 3.14 (via `brew install python`) — Homebrew-managed
- Black (via `brew install black`) — Python formatter, managed by Homebrew not Mason
- ripgrep (via `brew install ripgrep`) — required for Telescope live grep
- Tailscale (via `brew install --cask tailscale`) — needs manual install, requires sudo
- kubeseal (via `brew install kubeseal`) — for sealing secrets against the cluster's public key

## Git Identity
- username: `halitdincer`
- email: `github@halitdincer.com`

> Keep this section updated as new tools are installed.

## Dotfiles Repo
- Location: `~/Developers/dotfiles`
- Tracks shell config, tool configs, and setup scripts for this machine and homeserver
- See `~/Developers/dotfiles/README.md` for structure

## Projects
- Personal projects live under `~/Projects` (to be set up)
- Historical project archive is in `~/Documents` and `~/Desktop/Projects`

## Developers Repos
- `~/Developers/dotfiles` — shell config, tool configs, and setup scripts
- `~/Developers/homeserver-iac` — infrastructure-as-code for the homeserver
- `~/Developers/job-scout` — job scouting project

## Homeserver
- Proxmox host: `192.168.2.50` — Dell OptiPlex, Proxmox VE 9.1.1
- K3s VM: `192.168.2.216` — runs ArgoCD, Vault, cert-manager, all services
- SSH: `ssh -i ~/.ssh/id_ed25519 root@192.168.2.216` (key added via `curl https://github.com/halitdincer.keys`)
- Full docs: `~/Developers/homeserver-iac/CLAUDE.md`
- After power outage: unseal Vault → restart ArgoCD → restart external-secrets (see homeserver-iac CLAUDE.md)

## Dev Setup Preferences
- TBD — add preferences here as they emerge (editors, languages, workflows, etc.)

## Notes for Claude
- Always check this file for context before making decisions about tooling or structure
- When installing new tools or changing config, log it in this file AND in `~/dotfiles`
- Treat `~/dotfiles` as the source of truth for machine setup
- When unsure about a preference, ask — don't assume
