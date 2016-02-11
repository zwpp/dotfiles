#!/bin/sh
DOT_FILES=( .Xmodmap .vimrc .gvimrc .vim .zshrc .gitconfig .zsh)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
#install zplug
git clone https://github.com/b4b4r07/zplug ~/.zplug

