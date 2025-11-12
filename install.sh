#!/bin/bash

# dotfiles installation script

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/backup"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Function to backup and link
backup_and_link() {
    local file=$1
    local target="$HOME/$file"
    local source="$DOTFILES_DIR/$file"
    
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $file"
        mv "$target" "$BACKUP_DIR/${file#.}"
    fi
    
    ln -sfn "$source" "$target"
    echo "✓ $file linked"
}

# Install configurations
backup_and_link ".tigrc"

echo "Dotfiles installation completed!"
echo "Original files backed up to $BACKUP_DIR"