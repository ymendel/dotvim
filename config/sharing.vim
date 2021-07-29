function! SharemodeSetView()
    if has("gui_running")
        if g:sharing_mode
            set guifont=Menlo:h20
            set columns=113
            set lines=30
        else
            set guifont=Menlo:h13
            set columns=170
            set lines=48
        endif
    endif
endfunction

function! SharemodeToggle()
    let g:sharing_mode=!g:sharing_mode
    call SharemodeSetView()
endfunction

let g:sharing_mode=0

nnoremap <leader>st :call SharemodeToggle()<cr>
