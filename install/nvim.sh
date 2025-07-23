#!/bin/bash

if ! command -v nvim &>/dev/null; then
  yay -S --noconfirm --needed nvim luarocks tree-sitter-cli

  # Install nvim config from ireydiak/dotfiles
  rm -rf ~/.config/nvim
  git clone https://github.com/ireydiak/dotfiles /tmp/ireydiak-dotfiles
  cp -R /tmp/ireydiak-dotfiles/linux/nvim ~/.config/nvim
  rm -rf /tmp/ireydiak-dotfiles
fi
