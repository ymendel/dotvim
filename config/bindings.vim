let mapleader=','

" quick/easy ways to get out of insert mode
" shift-Enter, cmd-Enter, jk
inoremap <s-cr> <esc>
inoremap <d-cr> <esc>
inoremap jk     <esc>

" quick buffer switching
nnoremap <silent> <leader>[ :bprevious<cr>
nnoremap <silent> <leader>] :bnext<cr>

" shortcut to strip trailing whitespace
noremap <leader>s  :s/\s\+$//g<CR>
noremap <leader>sa :%s/\s\+$//g<CR>

" shortcut to delete blank lines
noremap <leader>db :g/^\s*$/d<CR>

" shortcut for titlecasing a line
noremap <leader>T :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>

" for quick extra config changes, while I'm in the middle of stuff
nnoremap <leader>ev :topleft :10split + $HOME/.vim/config/xtra.vim<cr>:setlocal nobuflisted<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
