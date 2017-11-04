nnoremap <leader>pm :CtrlPMixed<cr>
nnoremap <leader>pt :CtrlPTag<cr>
nnoremap <leader>pf :CtrlPFunky<cr>
nnoremap <leader>pF :execute 'CtrlPFunky ' . expand('<cword>')<cr>

let g:ctrlp_funky_matchtype = 'path'

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
