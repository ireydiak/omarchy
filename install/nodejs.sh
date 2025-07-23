#!/bin/bash

# Install Node.js LTS, pnpm, and Deno

echo "Installing Node.js development tools..."

# Install Node.js LTS via yay (nodejs-lts-iron is the current LTS)
yay -S --noconfirm --needed nodejs-lts-iron npm

# Install pnpm globally
npm install -g pnpm

# Install Deno
curl -fsSL https://deno.land/install.sh | sh

# Add Deno to PATH for current session
export PATH="$HOME/.deno/bin:$PATH"

# Verify installations
echo "Verifying installations..."
node --version
npm --version
pnpm --version
deno --version

echo "Node.js development environment setup complete!"