#!/bin/bash
DOT_FILES=(.Xmodmap .vimrc .gvimrc .vim .zshrc .gitconfig .zsh)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
#install zplug

if which zsh >/dev/null ;then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

#install neobundle if has vim
if which vim >/dev/null ;then
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh |sh
fi

