if has("nvim")
    set directory=~/.vim/swapfiles/nvim,/var/tmp,/tmp,.
else
    set directory=~/.vim/swapfiles,/var/tmp,/tmp,.
endif


" enable persistent undo
if has("persistent_undo")
    set undofile
    if has("nvim")
        set undodir=~/.vim/undofiles/nvim,/var/tmp,/tmp,.
    else
        set undodir=~/.vim/undofiles,/var/tmp,/tmp,.
    endif
endif

" handle one file open in two sessions {{{
" stop annoying me every time I have a file open in two different vim sessions
" 'e' is 'Edit Anyway' in this circumstance. Other options you could use here:
" 'q' - quit
" 'o' - open the file in read-only mode
" 'r' - recover the changes
augroup simuledit
   autocmd!
   autocmd SwapExists * :let v:swapchoice = 'e'
augroup END
" }}}
