""" NERDCommenter
let NERDCreateDefaultMappings = 0  " disable default mappings
let NERDMenuMode = 0               " disable menu
let NERDSpaceDelims = 1            " place spaces after comment chars
let NERDDefaultNesting = 0         " don't recomment commented lines

" <plug> causes trouble with noremap. One day I will understand this.
" Until then, this comment _should_ keep me from screwing this up again.
map <leader>cc <plug>NERDCommenterToggle
map <leader>cC <plug>NERDCommenterSexy
map <leader>cu <plug>NERDCommenterUncomment
map <leader>ca A <esc><plug>NERDCommenterAppend
