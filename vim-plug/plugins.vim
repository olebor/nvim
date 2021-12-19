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
		Plug 'onsails/lspkind-nvim'
		Plug 'kosayoda/nvim-lightbulb'
		" Plug 'kabouzeid/nvim-lspinstall'
		Plug 'simrat39/symbols-outline.nvim'

		" Telescope
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'nvim-telescope/telescope-media-files.nvim'

		" File Search
		Plug 'airblade/vim-rooter'
	
		Plug 'glepnir/galaxyline.nvim'

		" Terraform
		Plug 'hashivim/vim-terraform'

		" See what keys do like in emacs
		Plug 'liuchengxu/vim-which-key'


		" Navigation
		Plug 'MattesGroeger/vim-bookmarks'
		Plug 'unblevable/quick-scope'
		" Plug 'phaazon/hop.nvim'

		" Terminal
		Plug 'voldikss/vim-floaterm'
	endif
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
