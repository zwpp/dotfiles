#!/bin/sh
DOT_FILES=( .Xmodmap .vimrc .gvimrc .vim .zshrc .gitconfig .zsh)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
#install zplug

if which zsh >/dev/null ;then
  curl -sL zplug.sh/installer | zsh
fi

#install neobundle if has vim
if which vim >/dev/null ;then
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh |sh
fi

