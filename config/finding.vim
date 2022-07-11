" command mappings {{{
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>gf :GFiles<cr>
nnoremap <leader>gg :GGrep<cr>
nnoremap <leader>gs :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>m :Maps<cr>
" }}}

" supporting commands {{{
" GGrep {{{
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0], 'options': '--delimiter : --nth 3..' }),
            \   <bang>0)

" }}}

" proximity-sort handling {{{
let s:proximity_sort_path = $HOME . '/.cargo/bin/proximity-sort'

if executable(s:proximity_sort_path)
    " overwriting the commands {{{
    " Files {{{
    if executable('rg')
        command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({
                \ 'source': s:FzfProximitySortSource('rg --files'),
                \ 'options': [ '--tiebreak=index' ]
                \  }), <bang>0)
    endif
    " }}}

    " GFiles {{{
    command! -bang -nargs=? -complete=dir GFiles
        \ call fzf#vim#gitfiles('', fzf#vim#with_preview({
            \ 'source': s:FzfProximitySortSource('git ls-files --deduplicate'),
            \ 'options': [ '--tiebreak=index' ]
            \  }), <bang>0)
    " }}}

    " GStatus {{{
    " no proximity handling until I understand both how to handle the
    " proximity sorting _and_ get a good diff preview
    " but still defining here because GFiles is taken over
    command! -bang -nargs=? -complete=dir GStatus
        \ call fzf#vim#gitfiles('?', {
            \ 'source': 'git status --short',
            \ 'options': [ '--tiebreak=index' ]
            \  }, <bang>0)
    " }}}
    nnoremap <leader>gs :GStatus<cr>

    " command-providing function {{{
    function! s:FzfProximitySortSource(command)
        let l:base = fnamemodify(expand('%'), ':h:.:S')

        if base == '.'
            return printf('%s', a:command)
        else
            return printf('%s | %s %s', a:command, s:proximity_sort_path, expand('%'))
        endif
    endfunction
    " }}}
    " }}}
endif
" }}}
" }}}

" looks {{{
let g:fzf_layout = { 'down': '~30%' }

" no statusbar {{{
augroup fzf_status
    autocmd!
    autocmd FileType fzf set laststatus=0 noruler
                \| autocmd BufLeave <buffer> set laststatus=2 ruler
augroup END
" }}}

" colors {{{
" make fzf match the color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}
" }}}

" quickfixing {{{
" CTRL-A CTRL-Q to select all and build quickfix list
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
" }}}

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
