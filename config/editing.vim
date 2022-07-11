" line numbers and other current-line settings {{{
set number  " show line numbers
nnoremap <silent> <c-n> :set relativenumber!<cr>

" current-line highlighting {{{
if has("gui_running")
augroup curline_highlight
    autocmd!
    " highlight the current line in current window
    autocmd WinEnter,BufEnter * setlocal cursorline
    autocmd WinLeave          * setlocal nocursorline
augroup END
endif
" }}}
" }}}

set showmatch  " flash the matching bracket on inserting a )]} etc
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set formatoptions+=j  " remove comment leader when joining lines

" indentation settings {{{
" FIXME autoindenting, no need to specify? {{{
""" FIXME: everything works as expected without these, I'm sure
"""        that I'm just missing something
" set cindent     " c-style language indentation
" set autoindent  " automatically indent new lines
" set smartindent " automatically indent new lines
" }}}

" Re-indent when pasting
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" set splitting direction
set splitbelow
set splitright

" handle splitting/joining with splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap sj :SplitjoinJoin<cr>
nmap ss :SplitjoinSplit<cr>

" four-space standard {{{
" for most code, use 4 space indents. specific filetypes are overridden elsewhere
set softtabstop=4  " most of the time, we want a softtabstop of 4
set tabstop=4      " display tabs as 4 characters wide
set shiftwidth=4   " shift by 4 spaces when using >> and <<
set expandtab      " no tabs, just spaces
" }}}

" indentation re-set {{{
" using autocmd for this allows it to be reset every time you open a
" file, which keeps overrides from being persistent
augroup reset_indenting
    autocmd!
    autocmd FileType * set softtabstop=4 tabstop=4 shiftwidth=4 expandtab
augroup END
" }}}
" }}}

" whitespace, listchars, and other extra things being shown {{{
set list                     " show whitespace
set listchars=tab:»·,trail:· " show tabs and trailing spaces
set listchars+=extends:»     " show a » when a line goes off the right edge of the screen
set listchars+=precedes:«    " show a « when a line goes off the left edge of the screen

set showbreak=+  " display a + at the beginning of a wrapped line
" }}}
