set foldenable         " enable folding
set foldmethod=syntax  " use the syntax definitions' folding
set foldlevelstart=99  " start with all folds open when switching buffers
" set foldcolumn=3     " adds two columns of fold status on the left-hand side of the screen

" tab: toggle fold state
" shift-tab: toggle state of outermost fold
" ctrl-tab: open all folds
noremap <tab> za
noremap <s-tab> zA
noremap <c-tab> zR

" vim folding settings ---------------------- {{{
augroup vim_folding
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
