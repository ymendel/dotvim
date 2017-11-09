""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" K E Y   B I N D I N G S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=',' " set leader to ,

" quick buffer switching
map <leader>[ :bprevious<CR>
map <leader>] :bnext<CR>

" shortcut to strip trailing whitespace
map <leader>s  :s/\s\+$//g<CR>
map <leader>sa :%s/\s\+$//g<CR>

" shortcut to delete blank lines
map <leader>db :g/^\s*$/d<CR>

" shortcut for titlecasing a line
map <leader>T :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>

" fold helpers:
"   Tab: toggle fold state
"   Shift-Tab: toggle state of outermost fold
"   Ctrl-Tab: open all folds
map <TAB> za
map <S-TAB> zA
map <C-TAB> zR
