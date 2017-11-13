""" NERDCommenter
let NERDCreateDefaultMappings = 0  " disable default mappings
let NERDMenuMode = 0               " disable menu
let NERDSpaceDelims = 1            " place spaces after comment chars
let NERDDefaultNesting = 0         " don't recomment commented lines

noremap <leader>cc <plug>NERDCommenterToggle
noremap <leader>cC <plug>NERDCommenterSexy
noremap <leader>cu <plug>NERDCommenterUncomment
noremap <leader>ca $a <esc><plug>NERDCommenterAppend
