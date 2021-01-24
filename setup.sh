#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
DOT_FILES=(.vimrc)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

"${SCRIPT_DIR}/.vscode/vscode_install.sh"

echo "Done"
