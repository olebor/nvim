-- Auto-closes and auto-renames HTML/JSX tag pairs: typing `<div>` inserts the
-- closing tag, and editing either half renames the other. Driven by treesitter.
-- https://github.com/windwp/nvim-ts-autotag

return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
}
