set laststatus=2  " always show statusline
set noshowmode    " lightline handles this fine (as seen below)

let g:lightline = { 'colorscheme': 'wombat' }

" support functions {{{
" mode {{{
function! LightlineMode()
    if &filetype =~# '\v(help|fugitiveblame|nerdtree)'
        return ''
    endif

    return lightline#mode()
endfunction
" }}}

" git branch {{{
function! LightlineGitbranch()
    if &filetype =~# '\v(help|fugitiveblame|nerdtree)'
        return ''
    endif

    return fugitive#head()
endfunction
" }}}

" readonly {{{
function! LightlineReadonly()
    if &filetype =~# '\v(help|nerdtree)'
        return ''
    endif

    return &readonly ? 'RO' : ''
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

" filename {{{
function! LightlineFilename()
    if &filetype ==# 'fugitiveblame'
        return expand('#:t')
    endif

    let l:filename = expand('%:t')
    return empty(l:filename) ? '[No Name]' : l:filename
endfunction
" }}}

" file format {{{
function! LightlineFileFormat()
    if &filetype =~# '\v(help|fugitiveblame|nerdtree)'
        return ''
    endif

    return &fileformat
endfunction
" }}}

" file encoding {{{
function! LightlineFileEncoding()
    if &filetype =~# '\v(help|fugitiveblame|nerdtree)'
        return ''
    endif

    if &fileencoding !=# ''
        return &fileencoding
    else
        return &encoding
    endif
endfunction
" }}}

" file type {{{
function! LightlineFileType()
    if &filetype ==# 'nerdtree'
        return ''
    endif

    return empty(&filetype) ? 'no ft' : &filetype
endfunction
" }}}

" lineinfo {{{
function! LightlineLineinfo()
    if &filetype ==# 'fugitiveblame'
        return ''
    endif

    let l:pos  = getcharpos('.')
    let l:line = empty(wordcount()['bytes']) ? 0 : l:pos[1]
    let l:col  = empty(getline('.')) ? 0 : l:pos[2]

    return printf('%3d:%-2d', l:line, l:col)
endfunction
" }}}

" percent {{{
function! LightlinePercent()
    if &filetype ==# 'fugitiveblame'
        return ''
    endif

    let l:line = line('.')
    let l:lastline = line('$')

    return printf('%3d%%', ((l:line * 100)/l:lastline))
endfunction
" }}}
" }}}

" component setup {{{
let g:lightline.component_function = {
    \  'mode': 'LightlineMode',
    \  'gitbranch': 'LightlineGitbranch',
    \  'mergemode': 'LightlineMergemode',
    \  'readonly': 'LightlineReadonly',
    \  'filename': 'LightlineFilename',
    \  'fileformat': 'LightlineFileFormat',
    \  'fileencoding': 'LightlineFileEncoding',
    \  'filetype': 'LightlineFileType',
    \  'lineinfo': 'LightlineLineinfo',
    \  'percent': 'LightlinePercent',
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

" statusline setup {{{
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

" inactive statusline setup {{{
let g:lightline.inactive = {}
let g:lightline.inactive.left  = [ [ 'filename', 'modified' ] ]
let g:lightline.inactive.right = [ [ 'lineinfo' ],
                               \   [ 'percent' ],
                               \ ]
" }}}
" }}}
