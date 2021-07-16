nmap <leader>mt <plug>(MergetoolToggle)

" layout changes {{{
" layout logic {{{
function s:on_mergetool_set_layout(split)
    if a:split["layout"] ==# 'mr,b' && a:split["split"] ==# 'b'
        set nodiff
        set syntax=on

        resize 15
    endif
endfunction
" }}}

let g:mergetool_layout = 'mr,b'
let g:MergetoolSetLayoutCallback = function('s:on_mergetool_set_layout')
" }}}
