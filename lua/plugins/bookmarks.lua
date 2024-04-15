return {

	{ "tom-anders/telescope-vim-bookmarks.nvim" },

	{
		"MattesGroeger/vim-bookmarks",
		config = function()
			vim.g.bookmark_no_default_key_mappings = 1
			vim.g.bookmark_sign = ""
		end,
	},
}
