""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" P L U G I N   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" NERDCommenter
let NERDCreateDefaultMappings=0 " disable default mappings
let NERDMenuMode=0              " disable menu
let NERDSpaceDelims=1           " place spaces after comment chars
let NERDDefaultNesting=0        " don't recomment commented lines

map <leader>cc <plug>NERDCommenterToggle
map <leader>cC <plug>NERDCommenterSexy
map <leader>cu <plug>NERDCommenterUncomment
map <leader>ca <plug>NERDCommenterAppend

""" NERDTree
map <leader>d :NERDTreeToggle<cr>

""" buffergator
nnoremap <leader>b :BuffergatorToggle<cr>

""" tagbar
nnoremap <silent> <leader>tb :TagbarToggle<cr>
