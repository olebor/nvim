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

| Key             | Action                                          |
| --------------- | ----------------------------------------------- |
| `<leader>p`     | Find files (Telescope)                          |
| `<leader>e`     | Toggle file explorer (NvimTree)                 |
| `<leader>f`     | Find submenu (files, git files, grep, worktrees) |
| `<leader>g`     | Git submenu (lazygit, hunks, blame, diff)       |
| `<leader>l`     | LSP submenu (format, rename, symbols)           |
| `<leader>b`     | Buffer submenu (find, wrap, column highlight)   |
| `<leader>x`     | Trouble submenu (diagnostics, quickfix, symbols) |
| `<leader>S`     | Session submenu (restore / stop saving)         |
| `<leader>t`     | Terminal (floating toggle)                      |
| `<leader>w`     | Close buffer                                    |
| `<leader>n`     | Clear search highlight                          |
| `<leader>7`     | Toggle comment (normal + visual)                |
| `s` / `S`       | Flash jump to location / treesitter node        |
| `ys` / `ds` / `cs` | Add / delete / change surround (nvim-surround) |
| `m`             | Bookmarks submenu                               |
| `Tab` / `S-Tab` | Next / previous buffer                          |
| `jj` / `jk`     | Escape from insert mode                         |
| `Ctrl+h/j/k/l`  | Window navigation                               |
| `Alt+j/k`       | Move line up/down                               |

### LSP (when a server is attached)

These are set per-buffer in `nv/lsp/handlers.lua`, so they only exist when an LSP is running:

| Key          | Action                          |
| ------------ | ------------------------------- |
| `gd` / `gD`  | Go to definition / declaration  |
| `gr`         | References (Telescope)          |
| `gi`         | Implementations (Telescope)     |
| `K`          | Hover docs                      |
| `[d` / `]d`  | Previous / next diagnostic      |
| `gl`         | Show diagnostic for line        |
| `<leader>lf` | Format buffer (conform)         |
| `<leader>lr` | Rename symbol                   |

## Plugins

| Plugin             | Purpose                            |
| ------------------ | ---------------------------------- |
| telescope.nvim     | Fuzzy finder                       |
| nvim-tree          | File explorer                      |
| nvim-cmp + copilot | Completion (with Copilot via cmp)  |
| treesitter         | Syntax highlighting and folding    |
| gitsigns + lazygit | Git integration                    |
| git-worktree.nvim  | Worktree switching (`<leader>fw`)  |
| flash.nvim         | Quick cursor jumping (`s` / `S`)   |
| trouble.nvim       | Diagnostics / quickfix list        |
| persistence.nvim   | Per-directory session save/restore |
| bufferline         | Buffer tabs                        |
| lualine            | Status line                        |
| which-key          | Keybinding discovery               |
| mason + lspconfig  | LSP server management              |
| conform.nvim       | Formatting (prettier, stylua)      |
| toggleterm         | Floating terminal                  |
| nvim-spectre       | Project-wide search and replace    |

## LSP Servers

Managed by Mason. Auto-installed:

- `lua_ls` -- Lua
- `vtsls` -- TypeScript/JavaScript (faster than ts_ls)
- `eslint` -- JS/TS linting
- `terraformls` -- Terraform
- `yamlls` -- YAML

Formatting is handled by **conform.nvim** (not the LSP): prettier for JS/TS/JSON/YAML/HTML/CSS/Markdown, stylua for Lua. It runs **on save**, and falls back to the LSP for filetypes without a configured formatter. conform also picks up a project-local `node_modules/.bin/prettier` automatically.

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

## Making Changes

The config is plain Lua, loaded by lazy.nvim. The rules of thumb:

- **Editor options** (line numbers, tabs, scrolloff, ...) live in `lua/user/settings.lua`.
- **Core keybindings** (window nav, escape, line moves) live in `lua/user/keymappings.lua`.
- **Leader (`Space`) bindings** live in `lua/plugins/whichkey.lua`. New bindings should use the `.add()` API (the file also has some legacy `.register()` calls).
- **LSP keybindings** (`gd`, `gr`, `K`, ...) live in `lua/nv/lsp/handlers.lua` and are buffer-local — only active when a server attaches.

### Adding a plugin

Drop a new file in `lua/plugins/` that returns a lazy.nvim spec table. Everything in that folder is auto-imported — no central list to edit. Minimal example (`lua/plugins/example.lua`):

```lua
return {
	"author/plugin-name",
	event = "VeryLazy",        -- lazy-load trigger (or `cmd`, `keys`, `ft`)
	opts = {},                 -- passed to the plugin's setup()
}
```

Save the file, restart Neovim, and lazy.nvim will install it on startup (or run `:Lazy install`). Then commit `lazy-lock.json` so the version is pinned.

### Adding an LSP server

Add the server name to `ensure_installed` in `lua/nv/lsp/mason-lspconfig.lua`, then set it up in `lua/nv/lsp/lspconfig.lua` — add it to the `servers` loop if it needs no special options, or give it its own `setup{}` block if it does. Mason installs the binary automatically on next launch.

### Applying changes without restarting

```
:source %             -- re-run the current Lua file
:Lazy reload <plugin> -- reload a single plugin (e.g. which-key.nvim)
```

Most changes are simplest to test with a full restart, though.

## Diagnosing

When something misbehaves, in roughly this order:

```
:messages             -- see errors that scrolled past on startup
:checkhealth          -- broad health report (start here for "X doesn't work")
:Lazy                 -- plugin status; `L` shows the log, errors are flagged
:LspInfo              -- is a server attached to this buffer? which one?
:Mason                -- install/uninstall/inspect LSP servers & tools
:ConformInfo          -- which formatters conform will run for this buffer
:Trouble diagnostics  -- project-wide errors/warnings in a navigable list
:TSUpdate             -- update Treesitter parsers (fixes highlight glitches)
```

Tips:

- "My formatting isn't running" → `:ConformInfo` shows whether prettier/stylua were found and which ran.
- "Completion/hover/rename is dead" → `:LspInfo`; if no client is attached, check `:Mason` that the server is installed.
- "A keybinding does nothing" → press `Space` and wait for which-key, or run `:verbose map <lhs>` (e.g. `:verbose map <leader>lf`) to see what it's bound to and where.
- After editing Lua, `make lint` and `make style` catch syntax errors and formatting drift before you commit.

## Linting

```bash
make lint    # luacheck + shellcheck
make style   # stylua + shfmt
```
