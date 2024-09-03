"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

let mapleader = ";"
" Delete word
nnoremap dw diw

" Select all with Ctrl-a
nnoremap <C-a> gg<S-v>G

" New tab
" nnoremap <leader>te :tabedit 
" nnoremap <tab> :tabnext<CR>
" nnoremap <s-tab> :tabprev<CR>

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

" Replace hightlighted text
vnoremap <C-R> "hy:%s/<C-r>h//gc<left><left><left>

" Markdown preview
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
nmap <leader>tm <Plug>MarkdownPreviewToggle

" Move between buffers
nmap ]b :bnext<CR>
nmap [b :bprev<CR>

" Close buffer without closing the Window
nmap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" Map <leader>td to toggle diagnostics with notification
nnoremap <silent> <leader>td :call ToggleCocDiagnostics()<CR>

" Map <leader>tb to toggle buffer diagnostics with notification
nnoremap <silent> <leader>tb :call ToggleBufferDiagnostics()<CR>

" Map <leader>ts to toggle Coc suggestions
nnoremap <silent> <leader>ts :call ToggleCocSuggestions()<CR>

" Repace visual text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Close buffer without exitting vim 
nnoremap <silent> <leader>bd :bp \| sp \| bn \| bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom function
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Function to toggle diagnostics and display a message
function! ToggleCocDiagnostics()
  call CocAction('diagnosticToggle')
  if exists('b:coc_diagnostics_enabled') && b:coc_diagnostics_enabled
    let b:coc_diagnostics_enabled = 0
    echo "Diagnostics enabled"
  else
    let b:coc_diagnostics_enabled = 1
    echo "Diagnostics disabled"
  endif
endfunction

" Function to toggle buffer diagnostics and display a message
function! ToggleBufferDiagnostics()
  call CocAction('diagnosticToggleBuffer')
  if exists('b:coc_diagnostics_buffer_enabled') && b:coc_diagnostics_buffer_enabled
    let b:coc_diagnostics_buffer_enabled = 0
    echo "Buffer diagnostics enabled"
  else
    let b:coc_diagnostics_buffer_enabled = 1
    echo "Buffer diagnostics disabled"
  endif
endfunction

" Function to toggle Coc suggestions in the current buffer
function! ToggleCocSuggestions()
  if exists('b:coc_suggest_disable') && b:coc_suggest_disable
    unlet b:coc_suggest_disable
    echo "Coc suggestions enabled"
  else
    let b:coc_suggest_disable = 1
    echo "Coc suggestions disabled"
  endif
endfunction
