if has("gui_running")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" G U I   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme Tomorrow-Night-tweaked  " use a nice 256-color scheme in the gui
set mouse=a                 " use mouse when possible
set guifont=Inconsolata:h16 " Inconsolata, 16pt high

" set default window size
set columns=170
set lines=48

" GUI option string.  Values:
"   a: visual-mode selections go to the clipboard
"   A: modeless selections go to the clipboard
"   c: don't pop up windows; use the console for dialog boxes and such
"   e: use GUI tab bar instead of text tab bar
set guioptions=aAce

endif
