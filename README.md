# Neovim Config

Heavily inspired by [LunarVim](https://github.com/ChristianChiarulli/LunarVim), but stripped a bit to fit my needs.

# TODO

- [ ] Make sure treesitter don't run on help text

# Init

```
:PackerCompile
```

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
  - `npm install -g neovim prettier eslint_d`
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

# Language and Formatters

## Lua

** Language Server **
(https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone))
(https://github.com/Koihik/LuaFormatter)

```
yay -S lua-language-server

```

** Formatter **

```
sudo pacman -S cmake
sudo pacman -S luarocks
sudo luarocks install --server=https://luarocks.org/dev luaformatter
```

# Debugging

```
:checkhealth
```

