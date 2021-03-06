" command mappings {{{
" command-support vars {{{
let g:fzf_preview_cmd = "cat {}"

" For syntax highlighting, `brew install bat`
if executable('bat')
  let g:fzf_preview_cmd = g:plug_home . "/fzf.vim/bin/preview.sh {}"
endif

let s:proximity_sort_path = $HOME . '/.cargo/bin/proximity-sort'
" }}}

if (executable('rg') && executable(s:proximity_sort_path))
    nnoremap <leader>f :call fzf#vim#files('', { 'source': g:FzfFilesSource(),
        \ 'options': [
        \   '--tiebreak=index', '--preview', g:fzf_preview_cmd
        \  ]})<cr>
else
    nnoremap <leader>f :Files<cr>
endif
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>gg :GGrep<cr>
nnoremap <leader>st :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>m :Maps<cr>

" supporting commands {{{
" GGrep {{{
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   { 'dir': systemlist('git rev-parse --show-toplevel')[0], 'options': '--delimiter : --nth 3..' },
            \   <bang>0)

" }}}

" proximity-sort handling {{{
function! g:FzfFilesSource()
    let l:base = fnamemodify(expand('%'), ':h:.:S')

    if base == '.'
        return 'rg --files'
    else
        return printf('rg --files | %s %s', s:proximity_sort_path, expand('%'))
    endif
endfunction
" }}}
" }}}
" }}}

" looks {{{
let g:fzf_layout = { 'down': '~30%' }

" no statusbar {{{
augroup fzf_status
    autocmd!
    autocmd FileType fzf set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
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
  \ 'ctrl-s': 'rightbelow split',
  \ 'ctrl-v': 'rightbelow vsplit' }
