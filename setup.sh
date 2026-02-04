#!/bin/bash
set -e

echo "=== Neovim Config Setup ==="

# Check for required tools
command -v git >/dev/null 2>&1 || { echo "Error: git is required"; exit 1; }
command -v nvim >/dev/null 2>&1 || { echo "Error: neovim 0.11+ is required"; exit 1; }

# Check Neovim version
NVIM_VERSION=$(nvim --version | head -1 | sed 's/.*v\([0-9]*\.[0-9]*\).*/\1/')
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
    rustup component add rustfmt
else
    echo "Skipping rust-analyzer and rustfmt (rustup not found)"
fi

echo "Installing formatters (conform.nvim)..."

# JS/TS/HTML/CSS/JSON/YAML/Markdown formatters
npm install -g prettier @fsouza/prettierd

# Lua formatter
if command -v cargo &> /dev/null; then
    echo "Installing stylua..."
    cargo install stylua
else
    echo "Skipping stylua (cargo not found)"
fi

# Python formatter
if command -v pip &> /dev/null; then
    echo "Installing ruff..."
    pip install ruff --user
else
    echo "Skipping ruff (pip not found)"
fi

# Shell formatter
if ! command -v shfmt &> /dev/null; then
    echo "Installing shfmt..."
    curl -sS https://webi.sh/shfmt | sh
else
    echo "shfmt already installed"
fi

echo ""
echo "Setup Complete"
