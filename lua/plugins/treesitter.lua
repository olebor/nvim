-- nvim-treesitter `main` branch (the `master` branch is frozen and its
-- `nvim-treesitter.configs` module no longer exists). This branch is a
-- from-scratch rewrite: the plugin only installs parsers + queries, and the
-- actual features are Neovim's own — enabled per-buffer below.
--
-- Requires: nvim 0.12+, tree-sitter-cli, a C compiler, tar and curl.
-- Note: `main` does not support lazy-loading, hence `lazy = false`.

local ensure_installed = {
	"c",
	"dockerfile",
	"go",
	"html",
	"lua",
	"markdown",
	-- markdown_inline is what highlights code spans/links *inside* markdown;
	-- markdown alone leaves inline content unhighlighted.
	"markdown_inline",
	"typescript",
	"javascript",
	"json",
	"tsx",
	"terraform",
	"yaml",
	"vim",
}

-- Treesitter indenting is still experimental upstream, and yaml in particular
-- indents worse than the built-in rules (this matches the old `indent.disable`).
local no_ts_indent = {
	yaml = true,
}

local function configureTreesitter()
	local ts = require("nvim-treesitter")

	ts.setup({})

	-- `main` builds every parser by shelling out to the tree-sitter CLI, so
	-- without it each install fails separately and floods the messages with
	-- ENOENT. Say it once instead, and leave the already-built parsers alone.
	if vim.fn.executable("tree-sitter") == 1 then
		ts.install(ensure_installed)
	else
		vim.notify(
			"nvim-treesitter: `tree-sitter` CLI not found on PATH, skipping parser install.\n"
				.. "Install it (macOS: brew install tree-sitter-cli), then run :TSUpdate.",
			vim.log.levels.WARN
		)
	end

	-- Highlighting and indenting are opt-in per buffer on this branch. Keyed off
	-- the filetype's language rather than a filetype list so any parser that is
	-- present (including the ones Neovim ships) lights up automatically.
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("NvTreesitter", { clear = true }),
		callback = function(args)
			local lang = vim.treesitter.language.get_lang(args.match)
			if not lang then
				return
			end

			-- Fails when the parser isn't installed (yet) — that's the signal to
			-- leave this buffer on the default syntax/indent, so swallow it.
			if not pcall(vim.treesitter.start, args.buf, lang) then
				return
			end

			if not no_ts_indent[args.match] then
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end,
	})
end

return {
	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = configureTreesitter,
}
