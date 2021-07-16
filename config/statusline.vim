set laststatus=2  " always show statusline
set noshowmode    " lightline handles this fine (as seen below)

let g:lightline = { 'colorscheme': 'wombat' }

" support functions {{{
" readonly {{{
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction
" }}}

" mergemode {{{
function! LightlineMergemode()
  if get(g:, 'mergetool_in_merge_mode', 0)
    return '↸'
  endif

  if &diff
    return '↹'
  endif

  return ''
endfunction
" }}}
" }}}

" component setup {{{
let g:lightline.component_function = {
    \  'gitbranch': 'fugitive#head',
    \  'mergemode': 'LightlineMergemode',
    \  'readonly': 'LightlineReadonly',
    \ }
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
let g:lightline#ale#indicator_checking = '…'
" }}}

" active statusline setup {{{
let g:lightline.active = {}
let g:lightline.active.left  = [ [ 'mode', 'paste' ],
                             \   [ 'gitbranch', 'readonly', 'filename', 'modified', 'mergemode' ],
                             \ ]

let g:lightline.active.right = [ [ 'linter_checking', 'linter_errors', 'linter_warnings' ],
                             \   [ 'lineinfo' ],
                             \   [ 'percent' ],
                             \   [ 'fileformat', 'fileencoding', 'filetype' ],
                             \ ]
" }}}
