# Neovim Config

Heavily inspired by [LunarVim](https://github.com/ChristianChiarulli/LunarVim), but stripped a bit to fit my needs.

This config is still work in progress. Requires Neovim 0.5.

## Install Neovim

- Mac

  ```
  # Using Brew
  brew install --HEAD neovim # Nightly version
  brew upgrade neovim --fetch-HEAD # Sometimes you need to update
  ```

- Linux Appimage
  ```
  curl -L -o /tmp/nvim.appimage https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
  chmod +x /usr/local/bin/nvim
  ```

## Other useful stuff

- NodeJS
  - `npm install -g neovim prettier eslint_d`
- Treesitter


### Change key repeat delay
I think default key repeat and initial delay is way too long.

- Mac

```
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```
