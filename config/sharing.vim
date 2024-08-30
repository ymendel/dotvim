function! SharemodeSetFont()
    if g:sharing_mode
        let g:guifontsize="20"
    else
        let g:guifontsize="13"
    endif

    let &guifont=g:guifontname . ":h" . g:guifontsize
endfunction

function! SharemodeSetView()
    if g:sharing_mode
        set columns=113
        set lines=32
    else
        set columns=170
        set lines=48
    endif
endfunction

function! SharemodeToggle()
    let g:sharing_mode=!g:sharing_mode
    call SharemodeSetFont()

    if has("gui_macvim")
        call SharemodeSetView()
    endif
endfunction

let g:sharing_mode=0

if has("gui_running")
    nnoremap <leader>st :call SharemodeToggle()<cr>
endif
