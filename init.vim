:set relativenumber
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set ignorecase	" Search ignorecase
:set smartcase
" Disable backup
set nobackup
set nowb
set noswapfile

syntax on

" Optimize 
set synmaxcol=3000    "Prevent breaking syntax hightlight when string too long. Max = 3000"
set lazyredraw
au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None

let mapleader = ";"
set encoding=UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Delete word
nnoremap dw vb"_d

" Select all with Ctrl-a
nnoremap <C-a> gg<S-v>G

" New tab
nnoremap te :tabedit
nnoremap <tab> :tabnext<CR>
nnoremap <s-tab> :tabprev<CR>

" Window split
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" Resize pane
nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap /\ :noh<CR>

" Markdown preview
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

nnoremap <leader>l :nohlsearch<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme 
colorscheme onedark

" Custom hightlight
highlight MyFloatBorder guifg=#76ABAE guibg=#31363F
highlight MyDiagnosticFloat guifg=#A0153E guibg=#31363F

set termguicolors
autocmd VimEnter * call s:setup_lualine()
function! s:setup_lualine() abort
lua<<EOF
require("bufferline").setup{
  options = {
    indicator = {
      style = 'none',
    },
    diagnostics = "coc",
  }
}
EOF
endfunction

" Overwrite some color highlight 
if (has("autocmd"))
  augroup colorextend
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
  augroup END
endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Close buffer without exitting vim 
nnoremap <silent> <leader>bd :bp \| sp \| bn \| bd<CR>

" Other setting
for setting_file in split(glob(stdpath('config').'/config/*.vim'))
  execute 'source' setting_file
endfor

