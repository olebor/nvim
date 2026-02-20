local api = vim.api

--------------------------------------------------------------------------------
--
-- Highlight on yank
--
--------------------------------------------------------------------------------
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

--------------------------------------------------------------------------------
--
-- Folding
--
--------------------------------------------------------------------------------
local allFilesGrp = api.nvim_create_augroup("all_files", { clear = true })

api.nvim_create_autocmd("BufRead", {
	command = ":set foldlevel=20",
	group = allFilesGrp,
})

local jstsFilesGrp = api.nvim_create_augroup("filetype_js_ts", { clear = true })

api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript" },
	command = ":set foldmethod=expr",
	group = jstsFilesGrp,
})

api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript" },
	command = ":set foldexpr=nvim_treesitter#foldexpr()",
	group = jstsFilesGrp,
})

--------------------------------------------------------------------------------
--
-- Auto-reload files changed outside the editor
--
--------------------------------------------------------------------------------
local autoReadGrp = api.nvim_create_augroup("AutoRead", { clear = true })

api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	command = "silent! checktime",
	group = autoReadGrp,
})

api.nvim_create_autocmd("FileChangedShellPost", {
	callback = function()
		vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
	end,
	group = autoReadGrp,
})

local jsonFilesGrp = api.nvim_create_augroup("filetype_json", { clear = true })

api.nvim_create_autocmd("FileType", {
	pattern = { "json" },
	command = ":set foldmethod=indent",
	group = jsonFilesGrp,
})
