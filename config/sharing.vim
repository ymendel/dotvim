function! SharemodeSetView()
    if has("gui_running")
        if get(g:, 'sharing_mode', 0)
            set guifont=Menlo:h20
            set columns=113
            set lines=29
        else
            set guifont=Menlo:h13
            set columns=170
            set lines=48
        endif
    endif
endfunction

function! SharemodeToggle()
    if get(g:, 'sharing_mode')
        let g:sharing_mode=0
    else
        let g:sharing_mode=1
    endif
    call SharemodeSetView()
endfunction

let g:sharing_mode=0

nnoremap <leader>st :call SharemodeToggle()<cr>
