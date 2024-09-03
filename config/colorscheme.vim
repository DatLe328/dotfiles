" Set theme 
colorscheme onedark

" Custom hightlight
highlight MyFloatBorder guifg=#76ABAE guibg=#31363F
highlight MyDiagnosticFloat guifg=#A0153E guibg=#31363F

set termguicolors

" set termguicolors

" lua<<EOF
" require("bufferline").setup{
" 	highlights = {
" 		buffer_visible = {
" 			fg = '#ecebf0',
" 			bg = '#1a0b54',
" 		},
" 	}
" }
" EOF

" Overwrite some color highlight 
if (has("autocmd"))
  augroup colorextend
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
  augroup END
endif

