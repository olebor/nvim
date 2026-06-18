-- Claude Code in Neovim — the same IDE integration the official VS Code and
-- JetBrains extensions use: in-editor diffs you accept/reject, automatic
-- selection/context sharing, and an integrated terminal running the CLI.
-- Keymaps live in whichkey.lua under the <leader>a group.
-- https://github.com/coder/claudecode.nvim

return {
	"coder/claudecode.nvim",
	cmd = {
		"ClaudeCode",
		"ClaudeCodeFocus",
		"ClaudeCodeSelectModel",
		"ClaudeCodeAdd",
		"ClaudeCodeSend",
		"ClaudeCodeStatus",
		"ClaudeCodeStart",
		"ClaudeCodeStop",
		"ClaudeCodeDiffAccept",
		"ClaudeCodeDiffDeny",
	},
	config = function()
		require("claudecode").setup({
			-- Use Neovim's built-in terminal so we don't have to pull in
			-- snacks.nvim. Opens as a split on the right, VS Code style.
			terminal = {
				provider = "native",
				split_side = "right",
				split_width_percentage = 0.30,
			},
		})
	end,
}
