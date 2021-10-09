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
		" Theme and visuals
		Plug 'tomasr/molokai'
		Plug 'crusoexia/vim-monokai'
		Plug 'patstockwell/vim-monokai-tasty'
		Plug 'phanviet/vim-monokai-pro'
		Plug 'dracula/vim'
		Plug 'morhetz/gruvbox'
		Plug 'norcalli/nvim-colorizer.lua'

		" Cool Icons
		Plug 'kyazdani42/nvim-web-devicons'
		Plug 'ryanoasis/vim-devicons'

		" Auto pairs for '(' '[' '{'
		Plug 'jiangmiao/auto-pairs'
		" TODO: try https://github.com/windwp/nvim-autopairs

		" LSP and Language
		Plug 'neovim/nvim-lspconfig'
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

		" Better Syntax Support
		Plug 'sheerun/vim-polyglot'

		" Bar with icons and stuff
		Plug 'akinsho/nvim-bufferline.lua'

		" Telescope
		Plug 'nvim-lua/popup.nvim'
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'nvim-telescope/telescope-media-files.nvim'

		" File Search
		Plug 'airblade/vim-rooter'
		Plug 'dyng/ctrlsf.vim'
	
		" Plug 'vim-airline/vim-airline'
		Plug 'glepnir/galaxyline.nvim'

		" File Explorer
		Plug 'kyazdani42/nvim-tree.lua'

		" Smooth scroll
		Plug 'psliwka/vim-smoothie'
		
		" Intuitive buffer closing
		Plug 'moll/vim-bbye'

		" Terraform
		Plug 'hashivim/vim-terraform'

		" Comment Block
		Plug 'preservim/nerdcommenter'

		" Start Screen
		Plug 'mhinz/vim-startify'

		" See what keys do like in emacs
		Plug 'liuchengxu/vim-which-key'

		" Git
		"Plug 'nvim-lua/plenary.nvim'
		" Plug 'lewis6991/gitsigns.nvim'

		Plug 'airblade/vim-gitgutter'
		Plug 'tpope/vim-fugitive'
		" Plug 'tpope/vim-rhubarb'
		Plug 'junegunn/gv.vim'
		" Plug 'rhysd/git-messenger.vim'
		Plug 'APZelos/blamer.nvim'
		" Plug 'TimUntersberger/neogit'

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
