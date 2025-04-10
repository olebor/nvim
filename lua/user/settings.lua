vim.cmd("set iskeyword+=-")           -- treat dash separated words as a word text object"
vim.cmd("set shortmess+=c")           -- Don't pass messages to |ins-completion-menu|.
vim.cmd("set inccommand=split")       -- Make substitution work in realtime
vim.o.hidden = true                   -- Required to keep multiple buffers open multiple buffers
vim.wo.wrap = false                   -- Display long lines as just one line
vim.cmd("set whichwrap+=<,>,[,],h,l") -- move to next line with theses keys
vim.cmd("syntax on")                  -- Enables syntax highlighing
vim.o.pumheight = 10                  -- Makes popup menu smaller
vim.o.fileencoding = "utf-8"          -- The encoding written to file
vim.o.cmdheight = 2                   -- More space for displaying messages
vim.o.mouse = "a"                     -- Enable your mouse
vim.o.splitbelow = true               -- Horizontal splits will automatically be below
vim.o.splitright = true               -- Vertical splits will automatically be to the right
vim.o.termguicolors = true            -- set term giu colors most terminals support this
vim.o.conceallevel = 0                -- So that I can see `` in markdown files
vim.bo.smartindent = true             -- Makes indenting smart
vim.wo.number = true                  -- set numbered lines
vim.wo.cursorline = true              -- Enable highlighting of the current line
vim.o.showtabline = 2                 -- Always show tabs
vim.o.showmode = false                -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false                  -- This is recommended by coc
vim.o.writebackup = false             -- This is recommended by coc
vim.wo.signcolumn = "yes"             -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300                -- Faster completion
vim.o.clipboard = "unnamedplus"       -- Copy paste between vim and everything else (Require xclip on linux)

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.list = true
vim.o.listchars = "tab:| ,trail:~,extends:>,precedes:<,space:·"

vim.o.relativenumber = false
