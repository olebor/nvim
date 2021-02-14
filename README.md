# Neovim Config

Heavily inspired by https://github.com/ChristianChiarulli/nvim

## Clone this repo into your config

```
git clone git@gitlab.com:olebor/nvim.git ~/.config/nvim
```

## Install Neovim

- Mac

  ```
  brew install --HEAD neovim # Nightly version

  brew upgrade neovim --fetch-HEAD # Sometimes you need to update
  ```

- Ubuntu

  ```
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /tmp/nvim.appimage

  sudo mv /tmp/nvim.appimage /usr/local/bin/nvim

  chmod +x /usr/local/bin/nvim
  ```

  With APT

  ```
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim
  ```

- Arch

  ```
  yay -S neovim-git # Latest
  ```
