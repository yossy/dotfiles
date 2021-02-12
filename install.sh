#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
DOTPATH=~/dotfiles
DOTFILES_GITHUB=https://github.com/yossy/dotfiles.git

has() {
  type "$1" > /dev/null 2>&1
}

usage() {
  name=`basename $0`
  cat <<EOF
Usage:
  ./install.sh [command]
Example usage:
  ./install.sh i
  ./install.sh d
Commands:
  d deploy
  i initialize
EOF
  exit 1
}

initialize() {
  download_dotfiles() {
    # gitが使えるならgitでclone
    if has "git"; then
      git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"

    # gitがない場合はcurlでdownload
    elif has "curl"; then
      target="https://github.com/yossy/dotfiles/archive/main.tar.gz"
      curl -L "$target" | tar zxv
      # 解凍したらdotfiles-mainなので$DOTPATHにrenameと移動
      mv -f dotfiles-main "$DOTPATH"
    else
      die "curl or git required"
    fi

    cd "$DOTPATH"
    if [ $? -ne 0 ]; then
      die "not found: $DOTPATH"
    fi

    git submodule update --init --recursive
  }
  download_dotfiles

  install_brew_pkg() {
    if has "brew"; then
    echo "$(tput setaf 2)Already installed Homebrew ✔︎$(tput sgr0)"

    else
      echo "Installing Homebrew..."
      /bin/bash -i "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    if has "brew"; then
      brew bundle
    fi
  }
  install_brew_pkg

  initialize_anyenv() {
    anyenv install --init
    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
    git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
  }
  initialize_anyenv

  initialize_git-secrets() {
    git secrets --register-aws --global
  }
  initialize_git-secrets

  setup_prezto() {
    # add submodule for zprezto
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
  }
  setup_prezto

  # install vscode extensions
  "${SCRIPT_DIR}/.vscode/vscode_install.sh"

  # change shell
  chsh -s $(which zsh)

  source $SCRIPT_DIR/.zshrc
  source $SCRIPT_DIR/.zpreztorc

  echo "initialize done"
  zsh
}

deploy() {
  add_symlinks() {
    for f in .??*
    do
      [ "$f" = ".git" ] && continue
      [ "$f" = ".gitmodules" ] && continue
      [ "$f" = ".DS_Store" ] && continue

      ln -sf $HOME/dotfiles/$f $HOME/$f
    done
  }
  add_symlinks

  echo "deploy"
}

if [ "$1" = "deploy" -o "$1" = "d" ]; then
  deploy
elif [ "$1" = "init" -o "$1" = "i" ]; then
  initialize
elif [ "$1" = "help" -o "$1" = "h" ]; then
  usage
else
  usage
fi
