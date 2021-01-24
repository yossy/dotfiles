#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

echo "start setup..."

# add symlink dotfiles
for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".gitmodules" ] && continue
  [ "$f" = ".DS_Store" ] && continue

  ln -sf $HOME/dotfiles/$f $HOME/$f
done

# add submodule for zprezto
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

# install vscode extensions
"${SCRIPT_DIR}/.vscode/vscode_install.sh"

zsh
