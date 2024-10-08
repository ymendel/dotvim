set nocompatible  " to hell with vi compatibility!
set wildmenu      " fancy command completion menu!
set modeline      " enable modelines
set modelines=1   " just one modeline

set noerrorbells visualbell

" cpoptions {{{
" Miscellaneous Options. Values:
"   a: ":read" sets window filename
"   A: ":write" sets window filename
"   B: backslash has no special meaning in ":map"
"   c: search continues from the end of the match
"   e: automatically add <CR> to the end of executed registers
"   F: ":write" sets buffer filename
"   s: set buffer options on entering the buffer
"   W: refuse to overwrite a readonly file, even with :w!
"   Z: don't reset 'readonly' when using :w!
set cpoptions=aABceFsWZ
" }}}

set showcmd  " shows incomplete command to the left of the ruler
set hidden   " let buffers be hidden, instead of needing to be closed

set exrc     " allow project-specific configuration
set secure   " make the project-specific configs secure (unless owned by me)
