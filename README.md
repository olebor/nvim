# Neovim Config

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager and [Dracula](https://github.com/Mofiqul/dracula.nvim) as colorscheme (with a darker custom background).

## Structure

```
init.lua                  -- Entry point
lua/
  user/
    lazy.lua              -- Plugin manager bootstrap
    settings.lua          -- Editor options
    keymappings.lua       -- Core keybindings (Space as leader)
    autocommands.lua      -- Yank highlight, fold rules
  plugins/                -- Plugin specs (auto-imported by lazy.nvim)
  nv/lsp/                 -- LSP configuration (mason, lspconfig, handlers)
snippets/                 -- Custom vsnip snippets (JS/TS)
```

## Key Bindings

Leader key is `Space`. Press it and wait for [which-key](https://github.com/folke/which-key.nvim) to show available mappings.

| Key             | Action                                        |
| --------------- | --------------------------------------------- |
| `<leader>p`     | Find files (Telescope)                        |
| `<leader>e`     | Toggle file explorer (NvimTree)               |
| `<leader>f`     | Find submenu (files, git files, live grep)    |
| `<leader>g`     | Git submenu (lazygit, hunks, blame, diff)     |
| `<leader>l`     | LSP submenu (format, rename, symbols)         |
| `<leader>b`     | Buffer submenu (find, wrap, column highlight) |
| `<leader>s`     | Surround submenu                              |
| `<leader>t`     | Terminal (floating toggle)                    |
| `<leader>w`     | Close buffer                                  |
| `<leader>n`     | Clear search highlight                        |
| `<leader>7`     | Toggle comment (normal + visual)              |
| `s` / `S`       | Hop to char / word                            |
| `m`             | Bookmarks submenu                             |
| `Tab` / `S-Tab` | Next / previous buffer                        |
| `jj` / `jk`     | Escape from insert mode                       |
| `Ctrl+h/j/k/l`  | Window navigation                             |
| `Alt+j/k`       | Move line up/down                             |

## Plugins

| Plugin             | Purpose                           |
| ------------------ | --------------------------------- |
| telescope.nvim     | Fuzzy finder                      |
| nvim-tree          | File explorer                     |
| nvim-cmp + copilot | Completion (with Copilot via cmp) |
| treesitter         | Syntax highlighting and folding   |
| gitsigns + lazygit | Git integration                   |
| hop.nvim           | Quick cursor jumping              |
| bufferline         | Buffer tabs                       |
| lualine            | Status line                       |
| which-key          | Keybinding discovery              |
| mason + lspconfig  | LSP server management             |
| none-ls            | Formatting (prettier, stylua)     |
| toggleterm         | Floating terminal                 |
| nvim-spectre       | Project-wide search and replace   |

## LSP Servers

Managed by Mason. Auto-installed:

- `lua_ls` -- Lua
- `ts_ls` -- TypeScript/JavaScript
- `eslint` -- JS/TS linting
- `terraformls` -- Terraform
- `yamlls` -- YAML

## Install

### Neovim

```bash
# Mac
brew install neovim

# Linux (appimage)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage && sudo mv nvim.appimage /usr/local/bin/nvim
```

### Dependencies

```bash
npm install -g neovim prettier
```

- [ripgrep](https://github.com/BurntSushi/ripgrep) -- for Telescope live grep
- [fd](https://github.com/sharkdp/fd) -- for Telescope file finder
- [lazygit](https://github.com/jesseduffield/lazygit) -- for `<leader>gg`

### Key Repeat (macOS)

```bash
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```

Log out and back in for changes to take effect.

## Useful Commands

```
:checkhealth          -- Diagnose issues
:Lazy                 -- Plugin manager UI
:Mason                -- LSP server manager UI
:LspInfo              -- Check active LSP clients
:TSUpdate             -- Update Treesitter parsers
```

## Linting

```bash
make lint    # luacheck + shellcheck
make style   # stylua + shfmt
```
