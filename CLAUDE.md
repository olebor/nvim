# Neovim Config — Project Guide

## Overview

Personal Neovim config. Plugin manager: lazy.nvim. Colorscheme: Dracula (customized darker background). All plugin specs live in `lua/plugins/` and are auto-imported.

## Project Structure

- `init.lua` — Entry point. Loads keymappings, lazy.nvim, settings, autocommands, LSP.
- `lua/user/` — Core config: settings, keymappings (Space leader), autocommands, lazy.nvim bootstrap.
- `lua/plugins/` — One file per plugin (lazy.nvim specs). Each returns a table.
- `lua/nv/lsp/` — LSP setup: mason → mason-lspconfig → lspconfig. Handlers and providers in subdirs.
- `snippets/` — Custom vsnip snippets for JS/TS (JSON format).

## Conventions

- Indentation: tabs, not spaces (Lua files).
- Plugin specs: each file in `lua/plugins/` returns a lazy.nvim spec table.
- Keybindings: core bindings in `lua/user/keymappings.lua`, leader-prefixed bindings in `lua/plugins/whichkey.lua`. Do not change keybindings unless explicitly asked.
- LSP servers managed by Mason. Server list in `lua/nv/lsp/mason-lspconfig.lua`.
- Snippet engine is vsnip (not luasnip).
- Formatting handled by none-ls (prettier for JS/TS, stylua for Lua).

## Linting

```bash
make lint    # luacheck + shellcheck
make style   # stylua + shfmt
```

No `.stylua.toml` in repo — stylua uses defaults.

## Important Notes

- The colorscheme is Dracula with custom colors (see `lua/plugins/colorscheme.lua`). When hardcoding theme colors use: red `#ff5555`, green `#50fa7b`, bg `#101010`, selection `#222326`.
- `whichkey.lua` mixes legacy `.register()` API and new `.add()` API — new bindings should use `.add()`.
- Copilot integrates through nvim-cmp (copilot-cmp), not inline suggestions.
- Avoid eager-loading plugins. Use lazy.nvim events (`VeryLazy`, `InsertEnter`, `BufReadPre`) or `cmd` triggers.
