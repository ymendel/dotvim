set laststatus=2  " always show statusline
set noshowmode    " lightline handles this fine (as seen below)

" set up statusline, using lightline
let g:lightline = { 'colorscheme': 'wombat' }
let g:lightline.component_function = { 'gitbranch': 'fugitive#head' }
let g:lightline.component_expand = {
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ }
let g:lightline.component_type = {
    \  'linter_checking': 'left',
    \  'linter_warnings': 'warning',
    \  'linter_errors': 'error',
    \  'linter_ok': 'left',
    \ }

let g:lightline.active = {}
let g:lightline.active.left  = [ [ 'mode', 'paste' ],
                             \   [ 'gitbranch', 'readonly', 'filename', 'modified' ],
                             \ ]

let g:lightline.active.right = [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
                             \   [ 'lineinfo' ],
                             \   [ 'percent' ],
                             \   [ 'fileformat', 'fileencoding', 'filetype' ],
                             \ ]
