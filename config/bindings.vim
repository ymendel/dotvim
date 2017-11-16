let mapleader=','

" back to normal (mode) ---------------------- {{{
" quick/easy ways to get out of insert mode
" shift-Enter, cmd-Enter, jk
inoremap <s-cr> <esc>
inoremap <d-cr> <esc>
inoremap jk     <esc>
" }}}

" buffers ---------------------- {{{
" quick buffer switching
nnoremap <silent> <leader>[ :bprevious<cr>
nnoremap <silent> <leader>] :bnext<cr>
" }}}

" dealing with whitespace ---------------------- {{{
" strip trailing whitespace
noremap <leader>s  :s/\s\+$//g<cr>
noremap <leader>sa :%s/\s\+$//g<cr>

" delete blank lines
noremap <leader>db :g/^\s*$/d<cr>
" }}}

" changing case ---------------------- {{{
" titlecase a line (though currently not with rules like leaving 'a' alone)
nnoremap <leader>T :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<cr>

" uppercase current word (not sure what's going on with <c-u> not working, but I'm okay with <c-U> for now)
inoremap <c-U> <esc>viwUviw<esc>a
nnoremap <c-U> viwUviw<esc>
" }}}

" config changes ---------------------- {{{
" for quick extra config changes, while I'm in the middle of stuff
nnoremap <leader>ev :topleft :10split + $HOME/.vim/config/xtra.vim<cr>:setlocal nobuflisted<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}
