syntax on  " syntax highlighting

" use filetype plugins to determine indent settings
filetype plugin indent on

" ruby filetype special settings ---------------------- {{{
augroup filetype_ruby
    autocmd!
    " ruby and yaml files are indented by two
    autocmd FileType ruby,eruby,yaml setlocal softtabstop=2 tabstop=2 shiftwidth=2

    " special files getting filetype set ---------------------- {{{
    " Gemfile, Isolate, and config.ru are ruby
    autocmd BufNewFile,BufRead Gemfile   setfiletype ruby
    autocmd BufNewFile,BufRead Isolate   setfiletype ruby
    autocmd BufNewFile,BufRead config.ru setfiletype ruby
    " }}}

    " set up compiler for ruby files
    autocmd FileType ruby compiler ruby
augroup END
" }}}

" help filetype special settings ---------------------- {{{
augroup filetype_help
    autocmd!
    " don't show whitespace in help files
    autocmd FileType help setlocal nolist
augroup END
" }}}

" configs auto-set filetype ---------------------- {{{
augroup filetype_configs
    autocmd!
    " set filetype on config files for vim and bash
    autocmd BufNewFile,BufRead ~/dev/projects/mine/dotvim/* setfiletype vim
    autocmd BufNewFile,BufRead ~/.vim/*  setfiletype vim
    autocmd BufNewFile,BufRead ~/.bash/* setfiletype sh
augroup END
" }}}
