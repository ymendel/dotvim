syntax on  " syntax highlighting

" use filetype plugins to determine indent settings
filetype plugin indent on

" fzf for finding/setting filetype
nnoremap <leader>ft :Filetypes<cr>

" ruby filetype special settings {{{
augroup filetype_ruby
    autocmd!
    " special files getting filetype set {{{
    " Gemfile, Isolate, config.ru, *.cap are ruby
    autocmd BufNewFile,BufRead Gemfile   setfiletype ruby
    autocmd BufNewFile,BufRead Isolate   setfiletype ruby
    autocmd BufNewFile,BufRead config.ru setfiletype ruby
    autocmd BufNewFile,BufRead *.cap     setfiletype ruby
    " }}}

    " set up compiler for ruby files
    autocmd FileType ruby compiler ruby
augroup END
" }}}

" indentation with tabs for make/gitconfig {{
augroup filetype_indent_tabs
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd FileType gitconfig setlocal noexpandtab
augroup END
" }}}

" indentation level 2 for ruby/js/lua/scala/sql {{{
augroup filetype_indent_two
    autocmd!
    autocmd FileType ruby,eruby,yaml setlocal softtabstop=2 tabstop=2 shiftwidth=2
    autocmd FileType javascript,javascriptreact setlocal softtabstop=2 tabstop=2 shiftwidth=2
    autocmd FileType lua setlocal softtabstop=2 tabstop=2 shiftwidth=2
    autocmd FileType scala setlocal softtabstop=2 tabstop=2 shiftwidth=2
    autocmd FileType sql setlocal softtabstop=2 tabstop=2 shiftwidth=2
augroup END
" }}}

" help filetype special settings {{{
augroup filetype_help
    autocmd!
    " don't show whitespace in help files
    autocmd FileType help setlocal nolist
    " let me quit help more easily
    autocmd FileType help nnoremap <buffer> q :q<cr>
augroup END
" }}}

" git filetype special settings {{{
augroup filetype_git
    autocmd!
    " let me quit git more easily
    autocmd FileType git nnoremap <buffer> q :q<cr>
augroup END
" }}}

" fugitive filetype special settings {{{
augroup filetype_fugitive
    autocmd!
    " let me quit git more easily
    autocmd FileType fugitiveblame nnoremap <buffer> q :q<cr>
augroup END
" }}}

" configs auto-set filetype {{{
augroup filetype_configs
    autocmd!
    " set filetype on config files for vim and bash
    autocmd BufNewFile,BufRead ~/dev/projects/mine/dotvim/* setfiletype vim
    autocmd BufNewFile,BufRead ~/.vim/*  setfiletype vim
    autocmd BufNewFile,BufRead ~/.bash/* setfiletype sh
    autocmd BufNewFile,BufRead ~/.bashrc setfiletype sh
    autocmd BufNewFile,BufRead ~/.local_bashrc setfiletype sh
    autocmd BufNewFile,BufRead ~/.bash_profile setfiletype sh
augroup END
" }}}
