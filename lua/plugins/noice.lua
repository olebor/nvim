-- Replaces the bottom-of-screen cmdline with a centered command palette popup,
-- and routes messages/search through the same UI. This is the piece that makes
-- LazyVim feel polished.
-- https://github.com/folke/noice.nvim

local function configureNoice()
	require("noice").setup({
		presets = {
			-- Search stays on the classic bottom line (a centered popup for `/`
			-- hides the matches you're trying to look at).
			bottom_search = true,
			-- The headline feature: cmdline + completion menu as one centered popup.
			command_palette = true,
			-- Long messages open in a split instead of forcing "Press ENTER".
			long_message_to_split = true,
		},

		lsp = {
			-- Render LSP hover/signature docs through noice so they get the same
			-- markdown treatment as everything else, including nvim-cmp's
			-- documentation window.
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			-- fidget.nvim already renders LSP progress; leaving this on would
			-- draw it twice.
			progress = { enabled = false },
			-- Server-sent messages (the last route still defaulting to "notify").
			message = { view = "mini" },
		},

		-- Without nvim-notify installed, noice's default "notify" view has no
		-- backend. Send notifications and general messages to the built-in
		-- "mini" view instead: a small, self-dismissing line in the bottom right.
		messages = { view = "mini", view_error = "mini", view_warn = "mini" },
		notify = { view = "mini" },

		routes = {
			-- Demote the constant write/undo chatter ("42L, 1337B", "before #3")
			-- to the mini view so it never interrupts.
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
	})
end

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- Popup/layout primitives noice builds its windows from.
		"MunifTanjim/nui.nvim",
	},
	config = configureNoice,
}
