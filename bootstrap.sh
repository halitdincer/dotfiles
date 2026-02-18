#!/usr/bin/env bash
# bootstrap.sh — Run on a fresh machine to apply dotfiles
set -e

DOTFILES="$HOME/dotfiles"

echo "==> Starting bootstrap..."

# Symlink shell configs
# Example: ln -sf "$DOTFILES/configs/.zshrc" "$HOME/.zshrc"

echo "==> Bootstrap complete."
echo "    Review $DOTFILES/README.md for next steps."
