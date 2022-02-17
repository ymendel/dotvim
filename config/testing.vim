" this requires the test command variable to be set. That's what a
" project-level .vimrc is for

nnoremap <leader>RT :exe '!' . g:test_command shellescape(expand('%'),1)<cr>
nnoremap <leader>rt :exe '!' . g:test_command shellescape(expand('%'),1).':'.line('.')<cr>
