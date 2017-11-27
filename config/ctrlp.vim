let g:ctrlp_cmd = 'CtrlPMixed'  " use mixed mode by default
let g:ctrlp_mruf_relative = 1   " don't get MRU files from other projects
let g:ctrlp_funky_matchtype = 'path'

nnoremap <leader>pm :CtrlPMixed<cr>
nnoremap <leader>pt :CtrlPTag<cr>
nnoremap <leader>pf :CtrlPFunky<cr>
nnoremap <leader>pF :execute 'CtrlPFunky ' . expand('<cword>')<cr>

let g:ctrlp_buffer_func = {
    \ 'enter': 'HideStatus',
    \ 'exit':  'ShowStatus',
    \ }

function! HideStatus()
    set laststatus=0
endfunc

function! ShowStatus()
    set laststatus=2
endfunc
