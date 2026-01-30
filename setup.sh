#!/bin/bash
set -e

echo "=== Neovim Config Setup ==="

# Check for required tools
command -v git >/dev/null 2>&1 || { echo "Error: git is required"; exit 1; }
command -v nvim >/dev/null 2>&1 || { echo "Error: neovim 0.11+ is required"; exit 1; }

# Check Neovim version
NVIM_VERSION=$(nvim --version | head -1 | grep -oP 'v\K[0-9]+\.[0-9]+')
if [ "$(echo "$NVIM_VERSION < 0.11" | bc)" -eq 1 ]; then
    echo "Error: Neovim 0.11+ required (found $NVIM_VERSION)"
    exit 1
fi

# Check for npm
if ! command -v npm &> /dev/null; then
    echo "Error: npm is required. Install Node.js first."
    exit 1
fi

echo "Installing tree-sitter-cli..."
npm install -g tree-sitter-cli

echo "Installing LSP servers..."
npm install -g typescript typescript-language-server
npm install -g pyright
npm install -g vscode-langservers-extracted
npm install -g bash-language-server

# Optional: Rust setup
if command -v rustup &> /dev/null; then
    echo "Installing rust-analyzer..."
    rustup component add rust-analyzer
else
    echo "Skipping rust-analyzer (rustup not found)"
fi

echo ""
echo "Setup Complete"
