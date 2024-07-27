call plug#begin()
	" dark theme
	Plug 'joshdick/onedark.vim'
	Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
	
	Plug 'preservim/nerdtree'			" File browser
	Plug 'tpope/vim-commentary'			" Commenting gcc
	Plug 'ryanoasis/vim-devicons'                 " Icon
	
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" Fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Code intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'mattn/emmet-vim'				" support html code

	" Status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	
	" MarkdownPreview
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

	" Source code version control 
	Plug 'tpope/vim-fugitive'                     " Git infomation 
	Plug 'tpope/vim-rhubarb' 
	Plug 'airblade/vim-gitgutter'                 " Git show changes 
	Plug 'samoshkin/vim-mergetool'                " Git merge
	Plug 'Xuyuanp/nerdtree-git-plugin'	" Git status

	" Fold 
	Plug 'tmhedberg/SimpylFold'
call plug#end()

" Other setting
for setting_file in split(glob(stdpath('config').'/config/*.vim'))
  execute 'source' setting_file
endfor
for setting_file in split(glob(stdpath('config').'/plugin/*.vim'))
  execute 'source' setting_file
endfor
