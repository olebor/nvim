-- Auto-saves a session per working directory on exit; restore on demand.
-- Keymaps live in whichkey.lua under the <leader>S group.
-- https://github.com/folke/persistence.nvim

return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
}
