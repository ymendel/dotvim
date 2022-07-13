" support functions {{{
function NERDTreeMaybeFindToggle()
    if !exists("t:NERDTreeBufName") || (bufwinnr(t:NERDTreeBufName) == -1)
        if empty(expand('%'))
            NERDTree
        else
            NERDTreeFind
        endif
    else
        NERDTreeClose
    endif

endfunction
" }}}

nnoremap <leader>d :call NERDTreeMaybeFindToggle()<cr>

" set splitting direction
set splitbelow
set splitright

" but make help appear where I want
cnoremap help top help
