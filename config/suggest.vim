" GitHub Copilot {{{
imap <expr> <c-tab> CopilotAcceptOneWord()
imap <expr> <s-tab> CopilotAcceptOneCharacter()

" functions {{{
function! CopilotAcceptOneWord()
    let suggestion = copilot#Accept("")
    let bar = copilot#TextQueuedForInsertion()
    return split(bar, '[ .]\zs')[0]
endfunction

function! CopilotAcceptOneCharacter()
    let suggestion = copilot#Accept("")
    let bar = copilot#TextQueuedForInsertion()
    return bar[0]
endfunction
" }}}
" }}}
