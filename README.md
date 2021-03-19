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


  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz --output nvim-macos.tar.gz
  rm -rf ~/.dev/nvim-osx64
  tar xvvf nvim-macos.tar.gz -C ~/.dev/
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

## Other useful stuff

### NodeJS

- Ubuntu

  ```
  # https://github.com/nodesource/distributions/blob/master/README.md
  curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt-get install -y nodejs
  ```

## FZF and Search

https://www.chrisatmachine.com/Neovim/08-fzf/

- Mac

```
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install ripgrep
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install the_silver_searcher
brew install fd

```

- Ubuntu

```
sudo apt install fzf ripgrep universal-ctags silversearcher-ag fd-find

```

### Change key repeat delay

- Mac

```
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```
