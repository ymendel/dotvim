" I don't like the jarring appearance/disappearance of the column
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

highlight! link SignColumn Normal
highlight! GitGutterAdd guifg=PaleGreen
highlight! GitGutterChange guifg=yellow
highlight! GitGutterDelete guifg=OrangeRed

nnoremap <leader>gh :GitGutterLineHighlightsToggle<cr>
