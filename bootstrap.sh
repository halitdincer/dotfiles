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

# Symlink shell configs
# ln -sf "$DOTFILES/configs/.zshrc" "$HOME/.zshrc"

echo "==> Bootstrap complete."
echo "    Review $DOTFILES/README.md for next steps."
