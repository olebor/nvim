# Neovim Config

## Install Neovim

- Mac

  ```
  # using brew
  brew install --head neovim # nightly version
  brew upgrade neovim --fetch-head # sometimes you need to update
  ```

- Linux Appimage
  ```
  curl -L -o /tmp/nvim.appimage https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
  chmod +x /usr/local/bin/nvim
  ```

## Other useful stuff

- NodeJS
  - `npm install -g neovim prettier`
  - `npm install -g vscode-langservers-extracted` (Should be handled by mason)
- Treesitter
- rg (ripgrep)
- fd (https://github.com/sharkdp/fd)
- ranger
- lazygit
- highlight

### Change key repeat delay

I think default key repeat and initial delay is way too long.

- Mac

```
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

# Debugging

```
:checkhealth
```

# Remember after upgrade

- Upgrade Treesitter `:TSUpdate`
