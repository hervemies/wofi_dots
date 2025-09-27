#!/bin/bash

set -e

echo "Installing dots..."


# Check if wofi is installed
if ! command -v wofi &> /dev/null; then
    echo "Wofi is not installed. Attempting to install it..."

    # install via package manager
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y wofi
    elif command -v pacman &> /dev/null; then
        sudo pacman -Sy wofi --noconfirm
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y wofi
    else
        echo "Unsupported package manager. Please install Wofi manually."
        exit 1
    fi
else
    echo "Wofi is already installed."
fi

# Set target config path
WOFI_CONFIG_DIR="$HOME/.config/wofi"

# Create config directory if it doesn't exist
mkdir -p "$WOFI_CONFIG_DIR"

# Copy config files
echo "Copying config files to $WOFI_CONFIG_DIR..."
cp -r ./config/* "$WOFI_CONFIG_DIR"

echo "Wofi dotfiles installed successfully!"