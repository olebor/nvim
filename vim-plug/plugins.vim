" Autoinstall vim-plug 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
	if exists('g:vscode')
		" Section for VSCode Plugins
	else
		" LSP and Language
		" Plug 'neovim/nvim-lspconfig'
		Plug 'glepnir/lspsaga.nvim'
		Plug 'onsails/lspkind-nvim'
		Plug 'kosayoda/nvim-lightbulb'
		Plug 'kabouzeid/nvim-lspinstall'
		Plug 'simrat39/symbols-outline.nvim'

		" Autocomplete
		Plug 'hrsh7th/nvim-compe'
		Plug 'hrsh7th/vim-vsnip'
		Plug 'rafamadriz/friendly-snippets'

		" Treesitter
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
		Plug 'p00f/nvim-ts-rainbow'

		" Bar with icons and stuff
		Plug 'akinsho/nvim-bufferline.lua'

		" Needed by gitsigns + telescope
		" Plug 'nvim-lua/plenary.nvim'

		" Telescope
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'nvim-telescope/telescope-media-files.nvim'

		" File Search
		Plug 'airblade/vim-rooter'
		Plug 'dyng/ctrlsf.vim'
	
		" Plug 'vim-airline/vim-airline'
		Plug 'glepnir/galaxyline.nvim'

		" File Explorer
		" Plug 'kyazdani42/nvim-tree.lua'

		" Smooth scroll
		Plug 'psliwka/vim-smoothie'
		
		" Intuitive buffer closing
		Plug 'moll/vim-bbye'

		" Terraform
		Plug 'hashivim/vim-terraform'

		" Comment Block
		Plug 'preservim/nerdcommenter'

		" See what keys do like in emacs
		Plug 'liuchengxu/vim-which-key'

		" Git
		Plug 'lewis6991/gitsigns.nvim'

		Plug 'tpope/vim-fugitive'
		" Plug 'tpope/vim-rhubarb'
		Plug 'junegunn/gv.vim'
		Plug 'APZelos/blamer.nvim'

		" Navigation
		Plug 'MattesGroeger/vim-bookmarks'
		Plug 'unblevable/quick-scope'
		Plug 'phaazon/hop.nvim'

		" Terminal
		Plug 'voldikss/vim-floaterm'
	endif
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
