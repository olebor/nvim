return {
	"polarmutex/git-worktree.nvim",
	version = "^2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",
	config = function()
		local Hooks = require("git-worktree.hooks")

		Hooks.register(Hooks.type.SWITCH, Hooks.builtins.update_current_buffer_on_switch)
		Hooks.register(Hooks.type.DELETE, function()
			vim.cmd("e .")
		end)

		require("telescope").load_extension("git_worktree")
	end,
}
