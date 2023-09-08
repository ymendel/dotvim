nnoremap <leader>gb :GBrowse<cr>
nnoremap <leader>gl :GBrowse!<cr>

xnoremap <leader>gb :GBrowse<cr>
xnoremap <leader>gl :GBrowse!<cr>

nnoremap <leader>ga :Git add %<cr>

set tags+=.git/tags

let g:twiggy_group_locals_by_slash = 1
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'
let g:twiggy_split_position = 'topleft'

nnoremap <leader>br :Twiggy<cr>
