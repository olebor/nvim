vim.opt.iskeyword:append("-")          -- treat dash separated words as a word text object"
vim.opt.shortmess:append("c")          -- Don't pass messages to |ins-completion-menu|.
vim.opt.inccommand = "split"            -- Make substitution work in realtime
vim.o.hidden = true                     -- Required to keep multiple buffers open multiple buffers
vim.wo.wrap = false                     -- Display long lines as just one line
vim.opt.whichwrap:append("<,>,[,],h,l") -- move to next line with theses keys
vim.o.pumheight = 10                    -- Makes popup menu smaller
vim.o.fileencoding = "utf-8"            -- The encoding written to file
vim.o.cmdheight = 1                     -- Command line height
vim.o.mouse = "a"                       -- Enable your mouse
vim.o.splitbelow = true                 -- Horizontal splits will automatically be below
vim.o.splitright = true                 -- Vertical splits will automatically be to the right
vim.o.termguicolors = true              -- set term giu colors most terminals support this
vim.o.conceallevel = 0                  -- So that I can see `` in markdown files
vim.bo.smartindent = true               -- Makes indenting smart
vim.wo.number = true                    -- set numbered lines
vim.wo.cursorline = true                -- Enable highlighting of the current line
vim.o.showtabline = 2                   -- Always show tabs
vim.o.showmode = false                  -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false                    -- Don't create backup files
vim.o.writebackup = false               -- Don't create backup before overwriting
vim.o.swapfile = false                  -- Disable swap files
vim.wo.signcolumn = "yes"               -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300                  -- Faster completion
vim.o.clipboard = "unnamedplus"         -- Copy paste between vim and everything else (Require xclip on linux)
vim.o.undofile = true                   -- Persistent undo across sessions
vim.o.scrolloff = 8                     -- Keep 8 lines visible above/below cursor
vim.o.sidescrolloff = 8                 -- Keep 8 columns visible left/right of cursor

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.list = true
vim.o.listchars = "tab:| ,trail:~,extends:>,precedes:<,space:·"

vim.o.relativenumber = false
vim.o.autoread = true                   -- Auto-reload files changed outside the editor

-- Folding (driven by nvim-ufo, see lua/plugins/ufo.lua)
vim.o.foldlevel = 99                    -- Start with all folds open
vim.o.foldlevelstart = 99               -- Open all folds when opening a buffer
vim.o.foldenable = true                 -- Enable folding
vim.o.foldcolumn = "0"                  -- Native fold column off; drawn via statuscolumn below
vim.opt.fillchars = { eob = " ", fold = " " }

-- Custom gutter: a clean fold arrow (open/closed) with no nesting-level digits,
-- alongside the usual sign column and line numbers. The native foldcolumn shows
-- fold-level numbers when nesting exceeds its width, which is noisy.
local FOLD_OPEN = "\226\150\190" -- ▾
local FOLD_CLOSED = "\226\150\184" -- ▸

function _G.NvFoldColumn()
	local lnum = vim.v.lnum
	if vim.fn.foldlevel(lnum) == 0 then
		return " " -- no fold on this line
	end
	-- Closed fold: foldclosed() gives the exact start line, so this is reliable
	-- even for adjacent same-level folds.
	local closedStart = vim.fn.foldclosed(lnum)
	if closedStart ~= -1 then
		return closedStart == lnum and FOLD_CLOSED or " "
	end
	-- Open fold: mark the opening line (level higher than the line above).
	if vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1) then
		return FOLD_OPEN
	end
	return " "
end

function _G.NvNumberColumn()
	if not (vim.wo.number or vim.wo.relativenumber) then
		return ""
	end
	local num = vim.v.lnum
	if vim.wo.relativenumber and vim.v.relnum > 0 then
		num = vim.v.relnum
	end
	-- Highlight the current line's number like the native number column does.
	return (vim.v.relnum == 0 and "%#CursorLineNr#" or "%#LineNr#") .. num
end

-- Layout: fold arrow | signs | (right-aligned) number | text
vim.opt.statuscolumn = "%#FoldColumn#%{%v:lua.NvFoldColumn()%}%*%s%=%{%v:lua.NvNumberColumn()%} "
