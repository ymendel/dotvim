if has("gui_running")

set mouse=a  " use mouse when possible
set guifont=Menlo:h13

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
