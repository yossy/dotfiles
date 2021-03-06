#                                     _
#                             _______| |__  _ __ ___
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__
#                          (_)___|___/_| |_|_|  \___|
#

#=======================================
# Setup Environments
#=======================================
PATH="$PATH:~/bin"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/.anyenv/bin
export EDITOR=vim
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

#=======================================
# Setup alias
#=======================================
# ghqで管理しているファイルのpathをfzfで検索して出力
alias repos='ghq list -p | fzf'
# ghqで管理しているリポジトリにfzfで検索して移動
alias cdp='cd $(repos)'
alias vs='code $(repos)'
# 選択したリポジトリをWebのGithubで開く
alias ghw='gh repo view -w $(ghq list | fzf )'
alias lsa="ls -la"
alias cab="/usr/local/bin/cabextract -e SJIS"
alias vim="nvim"
alias lg="lazygit"

#=======================================
# Setup Functions
#=======================================
# historyで全履歴を一覧表示
function history-all { history -E 1 }

# コマンドのオプション、引数を補完してくれるようにする
autoload -U compinit
compinit

#=======================================
# Setup Rust
#=======================================
source "$HOME/.cargo/env"

#=======================================
# Setup Prezto
#=======================================
# github: https://github.com/sorin-ionescu/prezto
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
 source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# preztoのtheme'powerlevel9k'のための設定
POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# promptを新しい行で入力できるように。
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# 出力のあと一行入れる。
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# allowアイコンにする
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" \U25B8 "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

#=======================================
# Setup lazygit
#=======================================
# lazygitでrepogitoryの変更を行った場合に変更が反映されるようにする
function lg {
  export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

  lazygit "$@"

  if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
          cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
          rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
  fi
}

#=======================================
# Setup anyenv
#=======================================
eval "$(anyenv init - --no-rehash)"

#=======================================
# Setup direnv
#=======================================
eval "$(direnv hook zsh)"

#=======================================
# Setup Google Cloud SDK
#=======================================
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taiki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taiki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taiki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taiki/google-cloud-sdk/completion.zsh.inc'; fi

#=======================================
# Setup fzf
#=======================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 50% --reverse --border'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
# fzfでbranchを検索してcheckoutする
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

