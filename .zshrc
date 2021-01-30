#                                     _
#                             _______| |__  _ __ ___
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__
#                          (_)___|___/_| |_|_|  \___|
#



### Global
PATH="$PATH:~/bin"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/.anyenv/bin
export EDITOR=vim
export LANG=en_US.UTF-8

# ---------- alias ---------- #
# ghqで管理しているファイルのpathをpecoで検索して出力
alias repos='ghq list -p | peco'
# ghqで管理しているリポジトリにpecoで検索して移動
alias cdp='cd $(repos)'
alias vs='code $(repos)'
# 選択したリポジトリをWebのGithubで開く
alias ghw='gh repo view -w $(ghq list | peco)'
alias lsa="ls -la"
# ---------- alias ---------- #

# ---------- Setup Prezto ---------- #
# github: https://github.com/sorin-ionescu/prezto
# Source Prezto.
# NOTE: pecoの読み込みの前に必要。
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
 source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# ---------- Setup Prezto ---------- #

# ---------- Setup peco ---------- #
function peco-history-selection() {
   BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
   CURSOR=$#BUFFER
   zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
# ---------- Setup peco ---------- #

# historyで全履歴を一覧表示
function history-all { history -E 1 }

# コマンドのオプション、引数を補完してくれるようにする
autoload -U compinit
compinit

# ---------- Setup anyenv ---------- #
eval "$(anyenv init -)"
# ---------- Setup anyenv ---------- #

# ---------- Setup Google Cloud SDK ---------- #
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taiki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taiki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taiki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taiki/google-cloud-sdk/completion.zsh.inc'; fi
# ---------- Setup Google Cloud SDK ---------- #
