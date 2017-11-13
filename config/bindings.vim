let mapleader=',' " set leader to ,

" quick buffer switching
noremap <leader>[ :bprevious<CR>
noremap <leader>] :bnext<CR>

" shortcut to strip trailing whitespace
noremap <leader>s  :s/\s\+$//g<CR>
noremap <leader>sa :%s/\s\+$//g<CR>

" shortcut to delete blank lines
noremap <leader>db :g/^\s*$/d<CR>

" shortcut for titlecasing a line
noremap <leader>T :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>

" for quick extra config changes, while I'm in the middle of stuff
nnoremap <leader>ev :10split + $HOME/.vim/config/xtra.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
