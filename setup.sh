#!/bin/bash

rm -f ~/.vimrc

ln -s $(pwd)/.vimrc ~/.vimrc

mkdir -p ~/.vim/pack/plugins/start

git clone https://github.com/kien/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp 
git clone https://github.com/prabirshrestha/vim-lsp.git ~/.vim/pack/plugins/start/vim-lsp 

exit 0
