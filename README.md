# Halit's Dotfiles

Personal dotfiles and setup scripts for my MacBook and homeserver. Managed through Claude Code.

## Structure

```
dotfiles/
├── configs/        # App and tool config files (symlinked to their real locations)
├── scripts/        # Setup and utility scripts
├── macos/          # macOS-specific settings and defaults
├── bootstrap.sh    # Run this first on a new machine
└── README.md
```

## New Machine Setup

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install Claude Code
brew install --cask claude-code

# 3. Clone this repo
git clone <repo-url> ~/dotfiles

# 4. Run bootstrap
cd ~/dotfiles && ./bootstrap.sh
```

## Setup Log

### 2026-02-18 — New MacBook
- Installed Homebrew
- Installed Claude Code
- Initialized dotfiles repo
