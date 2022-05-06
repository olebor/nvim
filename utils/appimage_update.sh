#!/bin/bash

curl -L -o /tmp/nvim.appimage https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
chmod +x /usr/local/bin/nvim

