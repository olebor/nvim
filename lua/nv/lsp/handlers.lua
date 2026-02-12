local M = {}
local Log = require("core.log")

local nnoremap = require("user.keymap_utils").nnoremap

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	Log:error("Failed to load cmp_nvim_lsp")
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- TODO: backfill this to template
M.setup = function()
	vim.diagnostic.config({
		virtual_text = false,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = true,
			header = "",
			prefix = "",
		},
	})
end

local lspUtils = require("nv.lsp.utils")

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", '<cmd>lua vim.lsp.buf.hover({ border = "rounded" })<CR>', opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	--
	keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ scope="line" })<CR>', opts)
	keymap(bufnr, "n", "<C-k>", '<cmd>lua vim.lsp.buf.signature_help({ border = "rounded" })<CR>', opts)
	keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })<CR>', opts)
	keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })<CR>', opts)
	keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

	--
	nnoremap("gr", require("telescope.builtin").lsp_references, { desc = "LSP: [G]oto [R]eferences", buffer = bufnr })
	nnoremap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = bufnr }
	)

	-- Also mapped in which-key (<leader>ls)
	nnoremap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = bufnr }
	)

	-- Conflicts with <Leader>p (open files)
	-- nnoremap(
	-- "<leader>ps",
	-- require("telescope.builtin").lsp_workspace_symbols,
	-- { desc = "LSP: [P]roject [S]ymbols", buffer = bufnr }
	-- )
end

M.on_attach = function(client, bufnr)
	if client.name == "ts_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	lspUtils.setup_document_highlight(client, bufnr)
end

return M
