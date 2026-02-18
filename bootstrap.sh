#!/usr/bin/env bash
# bootstrap.sh — Run on a fresh machine to apply dotfiles
set -e

DOTFILES="$HOME/Developers/dotfiles"

echo "==> Starting bootstrap..."

# Git config
echo "==> Linking git config..."
ln -sf "$DOTFILES/configs/.gitconfig" "$HOME/.gitconfig"

# CLAUDE.md
echo "==> Linking CLAUDE.md..."
ln -sf "$DOTFILES/CLAUDE.md" "$HOME/CLAUDE.md"

# SSH config
echo "==> Linking SSH config..."
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
ln -sf "$DOTFILES/configs/ssh/config" "$HOME/.ssh/config"
chmod 600 "$HOME/.ssh/config"

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  echo "==> No SSH key found. Generating one..."
  ssh-keygen -t ed25519 -C "github@halitdincer.com" -f "$HOME/.ssh/id_ed25519" -N ""
  echo "==> Add the new key to GitHub:"
  echo "    gh ssh-key add ~/.ssh/id_ed25519.pub --title \"Machine Name Year\""
else
  echo "==> SSH key already exists, skipping keygen."
fi

# Symlink shell configs
# ln -sf "$DOTFILES/configs/.zshrc" "$HOME/.zshrc"

echo ""
echo "==> Bootstrap complete."
echo "    Review $DOTFILES/README.md for next steps."
