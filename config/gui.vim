if has("gui_running")

let g:guifontname="Fira Code"
let g:guifontsize="13"

if has("gui_macvim")
    set macligatures
endif

set mouse=a  " use mouse when possible
let &guifont=g:guifontname . ":h" . g:guifontsize

" Don’t blink cursor in normal mode
set guicursor=n:blinkon0

" set default window size
set columns=170
set lines=48

" guioptions {{{
" GUI option string.  Values:
"   a: visual-mode selections go to the clipboard
"   A: modeless selections go to the clipboard
"   c: don't pop up windows; use the console for dialog boxes and such
"   e: use GUI tab bar instead of text tab bar
set guioptions=aAce
" }}}

endif
