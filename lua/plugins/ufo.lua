-- https://github.com/kevinhwang91/nvim-ufo
-- Modern, consistent folding (treesitter syntax folds + indent fallback),
-- the closest thing to VS Code / mainstream-editor folding behaviour.

local function configureUfo()
	local ufo = require("ufo")

	-- Fold text: "{ first line } ⋯ (12 lines)" so collapsed folds stay readable.
	local function foldText(virtText, lnum, endLnum, width, truncate)
		local newVirtText = {}
		local suffix = ("  ⋯ (%d lines)"):format(endLnum - lnum)
		local sufWidth = vim.fn.strdisplaywidth(suffix)
		local targetWidth = width - sufWidth
		local curWidth = 0
		for _, chunk in ipairs(virtText) do
			local chunkText = chunk[1]
			local chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if targetWidth > curWidth + chunkWidth then
				table.insert(newVirtText, chunk)
			else
				chunkText = truncate(chunkText, targetWidth - curWidth)
				local hlGroup = chunk[2]
				table.insert(newVirtText, { chunkText, hlGroup })
				chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if curWidth + chunkWidth < targetWidth then
					suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
				end
				break
			end
			curWidth = curWidth + chunkWidth
		end
		table.insert(newVirtText, { suffix, "Comment" })
		return newVirtText
	end

	ufo.setup({
		-- Treesitter for languages with a parser, indent everywhere else.
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
		fold_virt_text_handler = foldText,
	})

	-- All four level commands below drive 'foldlevel' directly, so it stays the
	-- single source of truth. (UFO's openAllFolds/closeAllFolds work too but
	-- leave 'foldlevel' out of sync, which breaks the incremental zr/zm math.)
	vim.keymap.set("n", "zR", function()
		vim.wo.foldlevel = 99
	end, { desc = "Open all folds" })

	vim.keymap.set("n", "zM", function()
		vim.wo.foldlevel = 0
	end, { desc = "Close all folds" })

	-- zr: open one more fold level. [count]zr opens to a fixed level.
	vim.keymap.set("n", "zr", function()
		local count = vim.v.count
		vim.wo.foldlevel = count > 0 and count or vim.wo.foldlevel + 1
	end, { desc = "Open one more fold level ([count]zr = fixed level)" })

	-- Close every sibling fold at the cursor's level, scoped to the cursor's
	-- enclosing fold only, and one level deep (children keep their state, so
	-- reopening a sibling shows its full body). Driven by real fold-boundary
	-- motions because adjacent same-level folds can't be told apart by
	-- 'foldlevel' alone.
	local function foldSiblings()
		local cur = vim.fn.line(".")
		local level = vim.fn.foldlevel(cur)
		if level == 0 then
			return
		end

		-- Enclosing scope: the contiguous region whose lines all sit at or below
		-- the parent level (level - 1). A top-level fold (level 1) is scoped to
		-- the whole buffer.
		local last = vim.fn.line("$")
		local pstart, pend = 1, last
		if level > 1 then
			pstart, pend = cur, cur
			while pstart > 1 and vim.fn.foldlevel(pstart - 1) >= level - 1 do
				pstart = pstart - 1
			end
			while pend < last and vim.fn.foldlevel(pend + 1) >= level - 1 do
				pend = pend + 1
			end
		end

		-- Walk the direct child folds (exactly `level`) inside the scope, jumping
		-- past each one's body with ]z so nested folds are never visited.
		local view = vim.fn.winsaveview()
		local starts = {}
		vim.fn.cursor(pstart, 1)
		if vim.fn.foldlevel(pstart) == level then
			table.insert(starts, pstart)
			vim.cmd("normal! ]z")
		end
		while true do
			local before = vim.fn.line(".")
			vim.cmd("normal! zj")
			local line = vim.fn.line(".")
			if line == before or line > pend then
				break
			end
			if vim.fn.foldlevel(line) == level then
				table.insert(starts, line)
				vim.cmd("normal! ]z")
			end
		end

		-- Close each sibling fold with zc (one level only).
		for _, line in ipairs(starts) do
			if vim.fn.foldclosed(line) == -1 then
				vim.fn.cursor(line, 1)
				vim.cmd("normal! zc")
			end
		end
		vim.fn.winrestview(view)
	end

	-- zm: fold all sibling methods/blocks in the current scope (see above).
	-- [count]zm falls back to the simple "set foldlevel" behaviour.
	vim.keymap.set("n", "zm", function()
		local count = vim.v.count
		if count > 0 then
			vim.wo.foldlevel = count
		else
			foldSiblings()
		end
	end, { desc = "Fold sibling folds in current scope ([count]zm = fixed level)" })

	-- Peek the contents of the fold under the cursor without opening it.
	vim.keymap.set("n", "zK", function()
		local winid = ufo.peekFoldedLinesUnderCursor()
		if not winid then
			vim.lsp.buf.hover()
		end
	end, { desc = "Peek fold / hover" })
end

return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "BufReadPost",
	config = configureUfo,
}
