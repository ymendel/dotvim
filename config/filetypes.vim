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

" indentation level four for ...? {{{
augroup filetype_indent_four
    autocmd!
    autocmd FileType vim setlocal softtabstop=4 tabstop=4 shiftwidth=4
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
    autocmd BufNewFile,BufRead ~/.bash/* setfiletype bash
    autocmd BufNewFile,BufRead ~/.bashrc setfiletype bash
    autocmd BufNewFile,BufRead ~/.local_bashrc setfiletype bash
    autocmd BufNewFile,BufRead ~/.bash_profile setfiletype bash
augroup END
" }}}

" symlinks auto-set filetype {{{
" this only seems to be working in regular vim, not neovim
" and even then it's flaky
" Maybe need to give up on it
" ref:
" - https://vi.stackexchange.com/a/9963
" - https://www.reddit.com/r/neovim/comments/146dv14/ignore_part_of_filename_extension_before/
" augroup filetype_symlinks
"     autocmd!
"     " set filetype on symlink files based on the filename it will become
"     autocmd BufNewFile,BufRead ~/dev/projects/mine/dotfiles/*.symlink call SetSymlinkFiletype()
"     autocmd BufNewFile,BufRead ~/.dotfiles/*.symlink call SetSymlinkFiletype()
" augroup END

" support function {{
function SetSymlinkFiletype()
    let l:real_filename = '.' . expand('%:t:r')
    echom l:real_filename

    let l:matching = uniq(sort(filter(split(execute('autocmd filetypedetect'), "\n"), 'v:val =~ l:real_filename')))
    echom l:matching

    let l:real_filetype = ''

    for l:line in l:matching
        if l:line =~ 'setf\s'
            let l:real_filetype = matchstr(l:line, 'setf\s\+\zs\k\+')
            break
        endif
    endfor

    echom l:real_filetype
    let &ft=l:real_filetype
endfunction
" }}}
" }}}
