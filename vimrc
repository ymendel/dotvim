let mapleader = ','  " before *anything* is loaded, to prevent problems

" first the plugins
source $HOME/.vim/pluginit

" then the config files
runtime! config/**/*
