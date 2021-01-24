#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
DOT_FILES=(.vimrc .zshenv .zprofile .zshrc .zlogin .zlogout .zpreztorc .zprezto)

# add symlink dotfiles
for file in ${DOT_FILES[@]}
do
  ln -sf $HOME/dotfiles/$file $HOME/$file
done

# add submodule
git submodule update --init --recursive

# prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# change shell
chsh -s $(which zsh)

source $SCRIPT_DIR/.zshrc
source $SCRIPT_DIR/.zpreztorc

# vscodeのinstall
"${SCRIPT_DIR}/.vscode/vscode_install.sh"

echo Done

zsh
