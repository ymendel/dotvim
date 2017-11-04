""" NERDCommenter
let NERDCreateDefaultMappings = 0  " disable default mappings
let NERDMenuMode = 0               " disable menu
let NERDSpaceDelims = 1            " place spaces after comment chars
let NERDDefaultNesting = 0         " don't recomment commented lines

map <leader>cc <plug>NERDCommenterToggle
map <leader>cC <plug>NERDCommenterSexy
map <leader>cu <plug>NERDCommenterUncomment
map <leader>ca <plug>NERDCommenterAppend
