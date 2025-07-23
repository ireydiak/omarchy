#!/bin/bash

# Install Node.js, npm, pnpm, and deno using pacman (official repos)
# This will install the latest stable versions available in Arch repos
sudo pacman -S --needed --noconfirm nodejs npm pnpm deno

# Verify installation
if command -v node &>/dev/null && command -v npm &>/dev/null; then
  echo "Node.js $(node --version) and npm $(npm --version) installed successfully"
  
  # Check pnpm installation
  if command -v pnpm &>/dev/null; then
    echo "pnpm $(pnpm --version) installed successfully"
  else
    echo "pnpm installation failed, installing via npm..."
    npm install -g pnpm -y
  fi
  
  # Check deno installation
  if command -v deno &>/dev/null; then
    echo "deno $(deno --version | head -n1) installed successfully"
  else
    echo "deno installation failed, installing via curl..."
    curl -fsSL https://deno.land/install.sh | sh -s -- -y
    export PATH="$HOME/.deno/bin:$PATH"
  fi
else
  echo "Installation failed, trying from AUR..."
  
  # Fallback to AUR if official repos failed
  if command -v yay &>/dev/null; then
    yay -S --needed --noconfirm nodejs-lts-iron npm pnpm deno
  else
    echo "yay not found. Please install yay first or run the 1-yay.sh script"
    exit 1
  fi
fi

# Set npm to use global packages without sudo for current user
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'

# Add npm global bin to PATH if not already present
if ! grep -q "export PATH=~/.npm-global/bin:\$PATH" ~/.bashrc; then
  echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
fi

# Add deno bin to PATH if not already present and deno was installed via curl
if command -v deno &>/dev/null && [ -d "$HOME/.deno/bin" ]; then
  if ! grep -q "export PATH=\$HOME/.deno/bin:\$PATH" ~/.bashrc; then
    echo 'export PATH=$HOME/.deno/bin:$PATH' >> ~/.bashrc
  fi
fi