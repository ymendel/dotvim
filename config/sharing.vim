function! SharemodeSetView()
    if has("gui_running")
        if g:sharing_mode
            let g:guifontsize="20"
            set columns=113
            set lines=32
        else
            let g:guifontsize="13"
            set columns=170
            set lines=48
        endif

        let &guifont=g:guifontname . ":h" . g:guifontsize
    endif
endfunction

function! SharemodeToggle()
    let g:sharing_mode=!g:sharing_mode
    call SharemodeSetView()
endfunction

let g:sharing_mode=0

nnoremap <leader>st :call SharemodeToggle()<cr>
