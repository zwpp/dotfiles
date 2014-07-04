#!/bin/sh
DOT_FILES=( .Xmodmap .vimrc .gvimrc .vim .zshrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done