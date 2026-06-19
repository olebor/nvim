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

-- Folding is handled globally by nvim-ufo (see lua/plugins/ufo.lua) and the
-- fold settings in lua/user/settings.lua.

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
