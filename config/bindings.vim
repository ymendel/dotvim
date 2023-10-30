" back to normal (mode) {{{
" quick/easy ways to get out of insert mode
" shift-Enter, cmd-Enter, jk
inoremap <s-cr> <esc>
inoremap <d-cr> <esc>
inoremap jk     <esc>
" }}}

" filename (put in system paste buffer)
" could get full filename with '%:p'
nnoremap <leader>fn :let @*=expand('%')<cr>:echo @*<cr>

" buffers {{{
" quick buffer switching
nnoremap <silent> <leader>[ :bprevious<cr>
nnoremap <silent> <leader>] :bnext<cr>
" }}}

" dealing with whitespace {{{
" strip trailing whitespace
noremap <leader>s  :s/\s\+$//g<cr>
noremap <leader>sa :%s/\s\+$//g<cr>

" delete blank lines
noremap <leader>db :g/^\s*$/d<cr>
" 'normalize' blank lines, as in only one blank line in a group
noremap <leader>nb :%s/\n\{3,}/\r\r/<cr>
" }}}

" changing case {{{
" titlecase a line (though currently not with rules like leaving 'a' alone)
nnoremap <leader>T :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<cr>

" uppercase current word (not sure what's going on with <c-u> not working, but I'm okay with <c-U> for now)
inoremap <c-U> <esc>mqgUiw`qa
nnoremap <c-U>      mqgUiw`q
" }}}

" config changes {{{
" for quick extra config changes, while I'm in the middle of stuff
nnoremap <silent> <leader>ev :call XtraEdit()<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" XtraEdit function (and related) {{{
let g:xtra_edit_open = 0

function! XtraEdit()
    if g:xtra_edit_open
        1 wincmd w  " the topleft should keep it at window 1
    else
        topleft 10 split + $HOME/.vim/config/xtra.vim
        setlocal nobuflisted
        let g:xtra_edit_open = 1
    endif
endfunction

augroup xtra_edit_window_check
    autocmd!
    autocmd WinEnter * call XtraEditWindowCheck()
augroup END

function! XtraEditWindowCheck()
    " depending on where I am, this could be more or less of the path
    " so just grab the end of the path
    let s:window_1_bufname_end = join(split(bufname(winbufnr(1)), '/')[-2:], '/')
    if s:window_1_bufname_end !=# "config/xtra.vim"
        let g:xtra_edit_open = 0
    endif

    if g:xtra_edit_open
        let s:cur_window = winnr()
        1 wincmd w  " still banking on that topleft
        resize 10
        if s:cur_window != 1
            wincmd p
        endif
    endif
endfunction
" }}}
" }}}
