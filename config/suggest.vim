" GitHub Copilot {{{
" imap <expr> <c-tab> CopilotAcceptOneWord()
" imap <expr> <s-tab> CopilotAcceptOneCharacter()

" functions {{{
" function! CopilotAcceptOneWord()
"     let suggestion = copilot#Accept("")
"     let bar = copilot#TextQueuedForInsertion()
"     return split(bar, '[ .]\zs')[0]
" endfunction

" function! CopilotAcceptOneCharacter()
"     let suggestion = copilot#Accept("")
"     let bar = copilot#TextQueuedForInsertion()
"     return bar[0]
" endfunction
" }}}
" }}}

" CoC {{{
" rotate between suggestions - tab is forward, s-tab is backwards
inoremap <silent><expr> <tab>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<tab>" :
    \ coc#refresh()
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<c-h>"

" accept suggestion
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
                            \: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<cr>

" functions {{{
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction
" }}}
" }}}
