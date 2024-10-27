#!/bin/bash

echo "Initializing environment"

rm -f ~/.vimrc
rm -rf ~/.vim/pack
rm -rf ~/.config/nvim

ln -s $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/nvim ~/.config/nvim

mkdir -p ~/Projects
mkdir -p ~/.vim/pack/plugins/start

sudo apt update -y && sudo apt upgrade -y
sudo apt install vim nodejs npm openjdk-21-jdk neovim -y
sudo npm install -g typescript-language-server typescript

git clone https://github.com/kien/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp 
git clone https://github.com/prabirshrestha/vim-lsp.git ~/.vim/pack/plugins/start/vim-lsp 
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/pack/plugins/start/auto-pairs

git config --global user.email "natewilcox@gmail.com"
git config --global user.name "Nathan Wilcox"
git config --global credential.helper store

sudo_cmd="nathan ALL=(ALL) NOPASSWD: ALL"
sudo grep -qxF "$sudo_cmd" /ect/sudoers || echo "$sudo_cmd" | sudo tee -a /etc/sudoers  

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip \
    && cd ~/.local/share/fonts \
    && unzip -o FiraCode.zip \
    && rm -rf FiraCode.zip \
    && fc-cache -fv

exit 0
