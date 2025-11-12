#!/bin/bash

# dotfiles installation script

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create symbolic link for tig configuration
ln -sfn "$DOTFILES_DIR/.tigrc" "$HOME/.tigrc"
echo "✓ .tigrc linked"

echo "Dotfiles installation completed!"