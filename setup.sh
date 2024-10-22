#!/bin/bash

rm -f ~/.vimrc
rm -rf ~/.vim/pack

ln -s $(pwd)/.vimrc ~/.vimrc

mkdir -p ~/.vim/pack/plugins/start

sudo apt install vim nodejs npm openjdk-21-jdk -y
sudo npm install -g typescript-language-server typescript

git clone https://github.com/kien/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp 
git clone https://github.com/prabirshrestha/vim-lsp.git ~/.vim/pack/plugins/start/vim-lsp 
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/pack/plugins/start/auto-pairs

git config --global user.email "natewilcox@gmail.com"
git config --global user.name "Nathan Wilcox"
git config --global credential.helper store

exit 0
