#!/bin/bash

DOT_FILES=(.vimrc .zshrc .zshenv)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

### cloneしたら上のshellでシンボリックリンクを貼る。
