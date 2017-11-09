set number  " show line numbers
nnoremap <silent> <c-n> :set relativenumber!<cr>

if has("gui_running")
augroup curline_highlight
    autocmd!
    " highlight the current line in current window
    autocmd WinEnter,BufEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
endif

syntax on       " turn on syntax highlighting

set showbreak=+ " display a + at the beginning of a wrapped line
set showmatch   " flash the matching bracket on inserting a )]} etc

set hidden      " let buffers be hidden, instead of needing to be closed

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

""" FIXME: everything works as expected without these, I'm sure
"""        that I'm just missing something
"set cindent    " c-style language indentation
"set autoindent " automatically indent new lines
"set smartindent " automatically indent new lines

" for most code, use 4 space indents. specific filetypes are overridden
" in filetypes
set softtabstop=4 " most of the time, we want a softtabstop of 4
set tabstop=4     " display tabs as 4 characters wide
set shiftwidth=4  " shift by 4 spaces when using >> and <<, etc
set expandtab     " no tabs, just spaces kthx.

" Using autocmd for this allows it to be reset every time you open a
" file, which keeps overrides from being persistent
autocmd FileType * set softtabstop=4 tabstop=4 shiftwidth=4 expandtab

set list                     " show whitespace
set listchars=tab:»·,trail:· " show tabs and trailing spaces
set listchars+=extends:»     " show a » when a line goes off the right
                             " edge of the screen
set listchars+=precedes:«    " show a « when a line goes off the left
                             " edge of the screen
